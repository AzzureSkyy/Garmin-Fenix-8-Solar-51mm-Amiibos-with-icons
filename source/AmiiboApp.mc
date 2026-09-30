import Toybox.Application;
import Toybox.WatchUi;

class AmiiboApp extends Application.AppBase {

	function initialize() {
		AppBase.initialize();
	}

	function getInitialView() {
		return [ new AmiiboMenuView(), new AmiiboMenuDelegate() ];
	}
}

function getApp() as AmiiboApp {
	return Application.getApp() as AmiiboApp;
}
