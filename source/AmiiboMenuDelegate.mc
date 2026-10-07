// Project   : Garmin-Fenix-8-Solar-51mm-Amiibos-with-icons
// Author    : AzzureSkyy
// Watermark : AzzureSkyy
// Source    : https://github.com/AzzureSkyy/Garmin-Fenix-8-Solar-51mm-Amiibos-with-icons
// Copyright : (c) 2026 AzzureSkyy. All rights reserved. See LICENSE.
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
// AzzureSkyy
