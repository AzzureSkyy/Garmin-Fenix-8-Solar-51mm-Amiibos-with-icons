import Toybox.System;
import Toybox.WatchUi;

class AmiiboMenuDelegate extends WatchUi.Menu2InputDelegate {

	function initialize() {
		Menu2InputDelegate.initialize();
	}

	function onSelect(item) {
		System.println("Amiibo selected");
	}

	function onBack() {
		WatchUi.popView(WatchUi.SLIDE_DOWN);
	}
}
