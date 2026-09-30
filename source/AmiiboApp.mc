import Toybox.Application;
import Toybox.Graphics;
import Toybox.WatchUi;

class AmiiboApp extends Application.AppBase {

	function initialize() {
		AppBase.initialize();
	}

	function getInitialView() {
		var menu = new WatchUi.CustomMenu(60, Graphics.COLOR_WHITE, {});
		menu.addItem(new AmiiboMenuItem());
		return [ menu, new AmiiboMenuDelegate() ];
	}
}

function getApp() as AmiiboApp {
	return Application.getApp() as AmiiboApp;
}
