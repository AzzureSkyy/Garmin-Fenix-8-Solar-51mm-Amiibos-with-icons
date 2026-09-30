import Toybox.WatchUi;
import Toybox.Lang;

//! Scrollable native Menu2 listing every Amiibo name within a single
//! category, sourced from AmiiboData.getItems(categoryIndex). Items with
//! a matched bundled icon show it; others remain text-only.
class AmiiboItemMenu extends WatchUi.Menu2 {

	function initialize(categoryIndex as Number) {
		var title = AmiiboData.CATEGORY_NAMES[categoryIndex];
		Menu2.initialize({ :title => title });

		var items = AmiiboData.getItems(categoryIndex);
		for (var i = 0; i < items.size(); i += 1) {
			var entry = items[i] as Dictionary;
			var icon = entry[:icon];
			if (icon != null) {
				addItem(new WatchUi.MenuItem(entry[:name] as String, null, i, { :icon => icon }));
			} else {
				addItem(new WatchUi.MenuItem(entry[:name] as String, null, i, {}));
			}
		}
	}
}
