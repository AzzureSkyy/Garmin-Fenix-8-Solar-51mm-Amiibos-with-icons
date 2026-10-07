// Project   : Garmin-Fenix-8-Solar-51mm-Amiibos-with-icons
// Author    : AzzureSkyy
// Watermark : AzzureSkyy
// Source    : https://github.com/AzzureSkyy/Garmin-Fenix-8-Solar-51mm-Amiibos-with-icons
// Copyright : (c) 2026 AzzureSkyy. All rights reserved. See LICENSE.
import Toybox.WatchUi;
import Toybox.Lang;

//! Scrollable native Menu2 listing every bundled Amiibo category (one
//! entry per source folder), driven by the compiled-in AmiiboData module.
class AmiiboCategoryMenu extends WatchUi.Menu2 {

	function initialize() {
		Menu2.initialize({ :title => "Amiibo" });

		var names = AmiiboData.CATEGORY_NAMES;
		for (var i = 0; i < names.size(); i += 1) {
			addItem(new WatchUi.MenuItem(names[i], null, i, {}));
		}
	}
}
// AzzureSkyy
