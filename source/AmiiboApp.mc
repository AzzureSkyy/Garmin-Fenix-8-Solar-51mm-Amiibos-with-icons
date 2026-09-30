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
