import Toybox.WatchUi;
import Toybox.Lang;

//! Scrollable native Menu2 listing every Amiibo name within a single
//! category, sourced from AmiiboData.getItems(categoryIndex). Icon
//! rendering is currently disabled (caused a Symbol Not Found crash);
//! items are text-only until the icon integration is revisited.
class AmiiboItemMenu extends WatchUi.Menu2 {

	function initialize(categoryIndex as Number) {
		var title = AmiiboData.CATEGORY_NAMES[categoryIndex];
		Menu2.initialize({ :title => title });

		var items = AmiiboData.getItems(categoryIndex);
		for (var i = 0; i < items.size(); i += 1) {
			var entry = items[i] as Dictionary;
			addItem(new WatchUi.MenuItem(entry[:name] as String, null, i, {}));
		}
	}
}
