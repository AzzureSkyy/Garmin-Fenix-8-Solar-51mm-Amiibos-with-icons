import Toybox.WatchUi;
import Toybox.Lang;

//! Input delegate for the top-level Amiibo category menu. Selecting a
//! category pushes the scrollable item list for that category.
class AmiiboCategoryDelegate extends WatchUi.Menu2InputDelegate {

	function initialize() {
		Menu2InputDelegate.initialize();
	}

	function onSelect(item) {
		var categoryIndex = item.getId() as Number;
		WatchUi.pushView(new AmiiboItemMenu(categoryIndex), new AmiiboItemDelegate(categoryIndex), WatchUi.SLIDE_UP);
	}

	function onBack() {
		WatchUi.popView(WatchUi.SLIDE_DOWN);
	}
}
