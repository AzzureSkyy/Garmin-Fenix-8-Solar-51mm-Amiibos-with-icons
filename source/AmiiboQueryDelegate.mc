import Toybox.WatchUi;
import Toybox.Lang;

//! Input delegate for the Amiibo Queries menu. Handles adding a new
//! query entry via TextPicker, and returning to the Amiibo menu on back.
class AmiiboQueryDelegate extends WatchUi.Menu2InputDelegate {

	function initialize() {
		Menu2InputDelegate.initialize();
	}

	function onSelect(item) {
		var id = item.getId();
		if (id.equals("add_new")) {
			if (WatchUi has :TextPicker) {
				WatchUi.pushView(new WatchUi.TextPicker(""), new AmiiboQueryTextListener(), WatchUi.SLIDE_UP);
			}
		}
	}

	function onBack() {
		WatchUi.popView(WatchUi.SLIDE_DOWN);
	}
}

//! TextPicker delegate that saves the entered text as a new query
//! and refreshes the Amiibo Queries menu.
class AmiiboQueryTextListener extends WatchUi.TextPickerDelegate {

	function initialize() {
		WatchUi.TextPickerDelegate.initialize();
	}

	function onTextEntered(text as String, changed as Boolean) as Boolean {
		if (text != null && text.length() > 0) {
			AmiiboQueryStorage.addQuery(text);
		}
		WatchUi.switchToView(new AmiiboQueryMenu(), new AmiiboQueryDelegate(), WatchUi.SLIDE_IMMEDIATE);
		return true;
	}

	function onCancel() as Boolean {
		return true;
	}
}
