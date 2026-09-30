import Toybox.System;
import Toybox.WatchUi;

class AmiiboMenuDelegate extends WatchUi.BehaviorDelegate {

	function initialize() {
		BehaviorDelegate.initialize();
	}

	function onSelect() {
		System.println("Amiibo selected");
		return true;
	}
}
