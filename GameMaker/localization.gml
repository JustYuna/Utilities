global.localization = {
	"supported": ["en", "de"],
	"fallback": "en",
	"translations": {
		"no_translation": {
			en: "!!! MISSING !!!",
			de: "!!! FEHLT !!!",
		},

		"gui_menu_play": {
			en: "START",
			de: "START"
		},
		"gui_menu_extra": {
			en: "???",
			de: "???"
		}
	}
};

/// @function						localization_get("my_key", "en");
///	@param {string}		key			The key of your translation.
/// @param {string}		lang		Either manual key like "en" or os_get_language();
/// @description					Returns the translated text using a key, really simplified version.
function localization_get(key = "", lang = os_get_language())
{
	var localization = global.localization;
	var _supported = array_contains(localization.supported, lang);
	if (!_supported) { lang = localization.fallback; };

	var _struct_has = struct_exists(localization.translations, key);
	if (!_struct_has) {
		if (localization.translations[key][lang])
		{
			return localization.translations[key][lang];
		} else {
			return localization.translations[key][localization.fallback]
		}
	};

	var _translation = localization.translations[$ key];
	_struct_has = struct_exists(_translation, lang);

	if (!_struct_has) { return localization.translations[$ key][$ localization.fallback]; };
	return localization.translations[$ key][$ lang];
}