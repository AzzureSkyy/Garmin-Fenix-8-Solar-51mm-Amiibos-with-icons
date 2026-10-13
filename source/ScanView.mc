import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

// Monkey C version of the suggested NFC scan screen.
// Connect IQ has no NFC API, so the availability check always fails on
// current SDKs and the scan reports "NFC not supported." The UID formatting
// and lookup logic are real and can be tested with testUid().
class ScanView extends WatchUi.View {

	private var _status as String = "Press START to scan";

	function initialize() {
		View.initialize();
	}

	function onShow() as Void {
		setStatus(isNfcAvailable() ? "Ready. Tap SCAN." : "NFC not supported.");
	}

	function onUpdate(dc as Dc) as Void {
		var w = dc.getWidth();
		var h = dc.getHeight();
		dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
		dc.clear();
		dc.drawText(w / 2, h / 2 - 50, Graphics.FONT_XTINY, _status,
			Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
		dc.drawRectangle(w / 2 - 70, h / 2, 140, 40);
		dc.drawText(w / 2, h / 2 + 20, Graphics.FONT_TINY, "SCAN",
			Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
	}

	function isInScanButton(x as Number, y as Number) as Boolean {
		var w = System.getDeviceSettings().screenWidth;
		var h = System.getDeviceSettings().screenHeight;
		return x >= w / 2 - 70 && x <= w / 2 + 70 && y >= h / 2 && y <= h / 2 + 40;
	}

	function isNfcAvailable() as Boolean {
		return Toybox has :NFC;
	}

	function startNfcTagScan() as Void {
		if (!isNfcAvailable()) {
			setStatus("Cannot scan without NFC access.");
			return;
		}
		setStatus("Scanning...");
	}

	// Equivalent of onTagDiscovered: feed raw UID bytes through the lookup.
	function onTagDiscovered(uidBytes as Array<Number>) as Void {
		var uidHex = bytesToHexString(uidBytes);
		var entry = matchUidToAmiibo(uidHex);
		if (entry != null) {
			setStatus("Scan complete.");
			var message = (entry[0] as String)
				+ "\nIdentifier: " + (entry[2] as String)
				+ "\nTag UID: " + (entry[1] as String);
			WatchUi.pushView(new WatchUi.Confirmation(message), new AmiiboItemInfoDelegate(), WatchUi.SLIDE_UP);
		} else {
			setStatus("Unknown UID:\n" + uidHex);
		}
	}

	function testUid(uidBytes as Array<Number>) as Void {
		onTagDiscovered(uidBytes);
	}

	function bytesToHexString(bytes as Array<Number>) as String {
		var s = "";
		for (var i = 0; i < bytes.size(); i++) {
			s += (bytes[i] & 0xFF).format("%02X");
		}
		return s;
	}

	// Searches every category (one loaded at a time) for a matching tag UID.
	function matchUidToAmiibo(uidHex as String) as Array? {
		for (var c = 0; c < AmiiboData.CATEGORY_NAMES.size(); c++) {
			var items = AmiiboData.getItems(c);
			for (var i = 0; i < items.size(); i++) {
				if ((items[i][1] as String).equals(uidHex)) {
					return items[i];
				}
			}
		}
		return null;
	}

	function setStatus(text as String) as Void {
		_status = text;
		WatchUi.requestUpdate();
	}
}

class ScanDelegate extends WatchUi.BehaviorDelegate {

	private var _view as ScanView;

	function initialize(view as ScanView) {
		BehaviorDelegate.initialize();
		_view = view;
	}

	function onTap(evt as ClickEvent) as Boolean {
		var c = evt.getCoordinates();
		if (_view.isInScanButton(c[0], c[1])) {
			_view.startNfcTagScan();
			return true;
		}
		return false;
	}

	function onSelect() as Boolean {
		_view.startNfcTagScan();
		return true;
	}

	function onBack() as Boolean {
		WatchUi.popView(WatchUi.SLIDE_DOWN);
		return true;
	}
}
