import Toybox.WatchUi;
import Toybox.System;
import Toybox.Lang;

//! Input delegate for a single Amiibo category's item list. Selecting an
//! item shows its Identifier / tag UID; back returns to categories.
class AmiiboItemDelegate extends WatchUi.Menu2InputDelegate {

	private var _items as Array<Array>;

	function initialize(items as Array<Array>) {
		Menu2InputDelegate.initialize();
		_items = items;
	}

	function onSelect(item) {
		var entry = _items[item.getId() as Number];
		var message = (entry[0] as String)
			+ "\nIdentifier: " + (entry[2] as String)
			+ "\nTag UID: " + (entry[1] as String);
		System.println(message);
		WatchUi.pushView(new WatchUi.Confirmation(message), new AmiiboItemInfoDelegate(), WatchUi.SLIDE_UP);
	}

	function onBack() {
		WatchUi.popView(WatchUi.SLIDE_DOWN);
	}
}

//! Dismisses the item info confirmation dialog back to the item list.
class AmiiboItemInfoDelegate extends WatchUi.ConfirmationDelegate {

	function initialize() {
		ConfirmationDelegate.initialize();
	}

	function onResponse(response) {
		return true;
	}
}
