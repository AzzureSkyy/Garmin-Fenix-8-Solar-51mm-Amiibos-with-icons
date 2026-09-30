import Toybox.Application;
import Toybox.WatchUi;

class AmiiboApp extends Application.AppBase {

	function initialize() {
		AppBase.initialize();
	}

	function getInitialView() {
		var menu = new WatchUi.Menu2({ :title => "Amiibo" });
		menu.addItem(new AmiiboMenuItem());
		return [ menu, new AmiiboMenuDelegate() ];
	}
}

function getApp() as AmiiboApp {
	return Application.getApp() as AmiiboApp;
}
