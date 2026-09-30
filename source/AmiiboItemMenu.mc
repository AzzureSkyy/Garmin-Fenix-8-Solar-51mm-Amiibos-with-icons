import Toybox.WatchUi;
import Toybox.Lang;

//! Scrollable native Menu2 listing every Amiibo within a single category,
//! each with a small icon matched by Amiibo ID. Icons load lazily as rows
//! are drawn, so large categories stay within the watch-app memory limit.
class AmiiboItemMenu extends WatchUi.Menu2 {

	function initialize(categoryIndex as Number, items as Array<Array>) {
		Menu2.initialize({ :title => AmiiboData.CATEGORY_NAMES[categoryIndex] });

		for (var i = 0; i < items.size(); i += 1) {
			var row = items[i];
			addItem(new WatchUi.IconMenuItem(row[0] as String, null, i,
				new AmiiboIconDrawable(row[3] as Number), null));
		}
	}
}
