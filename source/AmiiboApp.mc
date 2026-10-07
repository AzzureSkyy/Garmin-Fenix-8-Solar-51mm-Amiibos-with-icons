// Project   : Garmin-Fenix-8-Solar-51mm-Amiibos-with-icons
// Author    : AzzureSkyy
// Watermark : AzzureSkyy
// Source    : https://github.com/AzzureSkyy/Garmin-Fenix-8-Solar-51mm-Amiibos-with-icons
// Copyright : (c) 2026 AzzureSkyy. All rights reserved. See LICENSE.
import Toybox.Application;
import Toybox.Graphics;
import Toybox.WatchUi;

class AmiiboApp extends Application.AppBase {

	function initialize() {
		AppBase.initialize();
	}

	function getInitialView() {
		// Open straight into the Amiibo category list (no splash menu).
		return [ new AmiiboCategoryMenu(), new AmiiboCategoryDelegate() ];
	}
}

function getApp() as AmiiboApp {
	return Application.getApp() as AmiiboApp;
}
// AzzureSkyy
