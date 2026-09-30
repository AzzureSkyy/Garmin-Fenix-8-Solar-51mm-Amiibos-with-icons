import Toybox.Application.Storage;
import Toybox.Lang;

//! Helper module for persisting a simple list of user-added "query" strings
//! using the app's on-device Storage (Toybox.Application.Storage).
module AmiiboQueryStorage {

	const STORAGE_KEY = "amiiboQueries";

	//! Returns the stored list of query strings (empty array if none saved yet).
	function getQueries() as Array<String> {
		var stored = Storage.getValue(STORAGE_KEY);
		if (stored == null) {
			return [];
		}
		return stored as Array<String>;
	}

	//! Appends a new query string to storage and returns the updated list.
	function addQuery(text as String) as Array<String> {
		var list = getQueries();
		list.add(text);
		Storage.setValue(STORAGE_KEY, list);
		return list;
	}
}
