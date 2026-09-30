import Toybox.System;
import Toybox.WatchUi;

class AmiiboMenuDelegate extends WatchUi.Menu2InputDelegate {

	function initialize() {
		Menu2InputDelegate.initialize();
	}

	function onSelect(item) {
		WatchUi.pushView(new AmiiboCategoryMenu(), new AmiiboCategoryDelegate(), WatchUi.SLIDE_UP);
	}

	function onBack() {
		WatchUi.popView(WatchUi.SLIDE_DOWN);
	}
}
