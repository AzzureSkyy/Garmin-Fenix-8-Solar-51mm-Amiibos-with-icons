import Toybox.WatchUi;
import Toybox.Lang;

//! Large categories (e.g. Animal Crossing, 600+ items) are split into
//! pages so only one page of menu rows/icons is built at a time; building
//! every row at once exhausts memory / trips the watchdog on first open.
module AmiiboPaging {
	const PAGE_SIZE = 100;
}

class AmiiboPageMenu extends WatchUi.Menu2 {

	function initialize(categoryIndex as Number, total as Number) {
		Menu2.initialize({ :title => AmiiboData.CATEGORY_NAMES[categoryIndex] });

		for (var start = 0; start < total; start += AmiiboPaging.PAGE_SIZE) {
			var end = start + AmiiboPaging.PAGE_SIZE;
			if (end > total) {
				end = total;
			}
			addItem(new WatchUi.MenuItem((start + 1) + " - " + end, null, start, {}));
		}
	}
}

class AmiiboPageDelegate extends WatchUi.Menu2InputDelegate {

	private var _categoryIndex as Number;

	function initialize(categoryIndex as Number) {
		Menu2InputDelegate.initialize();
		_categoryIndex = categoryIndex;
	}

	function onSelect(item) {
		var start = item.getId() as Number;
		var all = AmiiboData.getItems(_categoryIndex);
		var end = start + AmiiboPaging.PAGE_SIZE;
		if (end > all.size()) {
			end = all.size();
		}
		var items = all.slice(start, end) as Array<Array>;
		all = null;
		WatchUi.pushView(new AmiiboItemMenu(_categoryIndex, items), new AmiiboItemDelegate(items), WatchUi.SLIDE_UP);
	}

	function onBack() {
		WatchUi.popView(WatchUi.SLIDE_DOWN);
	}
}
