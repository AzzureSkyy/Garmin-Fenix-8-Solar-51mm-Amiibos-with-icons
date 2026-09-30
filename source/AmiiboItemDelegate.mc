import Toybox.WatchUi;
import Toybox.System;
import Toybox.Lang;

//! Input delegate for a single Amiibo category's item list. Selecting an
//! item shows its bundled metadata (Identifier / tag UID extracted from the
//! unencrypted portion of the .bin dump); back returns to categories.
class AmiiboItemDelegate extends WatchUi.Menu2InputDelegate {

	private var _categoryIndex as Number;

	function initialize(categoryIndex as Number) {
		Menu2InputDelegate.initialize();
		_categoryIndex = categoryIndex;
	}

	function onSelect(item) {
		var itemIndex = item.getId() as Number;
		var entry = AmiiboData.getItems(_categoryIndex)[itemIndex] as Dictionary;
		var message = (entry[:name] as String)
			+ "\nIdentifier: " + (entry[:amiiboId] as String)
			+ "\nTag UID: " + (entry[:uid] as String);
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
		WatchUi.popView(WatchUi.SLIDE_DOWN);
		return true;
	}
}
