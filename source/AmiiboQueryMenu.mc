import Toybox.WatchUi;
import Toybox.Lang;

//! Scrollable native Menu2 listing previously saved Amiibo query entries,
//! plus a fixed item at the top to add a new one.
class AmiiboQueryMenu extends WatchUi.Menu2 {

	function initialize() {
		Menu2.initialize({ :title => "Amiibo Queries" });

		addItem(new WatchUi.MenuItem("+ Add New", null, "add_new", {}));

		var queries = AmiiboQueryStorage.getQueries();
		for (var i = 0; i < queries.size(); i += 1) {
			addItem(new WatchUi.MenuItem(queries[i], null, "query_" + i, {}));
		}
	}
}
