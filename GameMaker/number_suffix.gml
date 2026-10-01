/// @function						suffix_number(number, mode);
///	@param {number}		number		The amount to format.
/// @param {boolean}	scientific	If it should format scientific, default false.
/// @description					Turns the input into a readable number format.
function suffix_number(n, scientific = false)
{
	var val = abs(n);
	if (val >= math_e(1.79, 308)) return "Infinite";
	
	var suffixes = [
		[math_e(1, 3), "K"],
		[math_e(1, 6), "M"],
		[math_e(1, 9), "B"],
		[math_e(1, 12), "T"],
		[math_e(1, 15), "Qa"],
		[math_e(1, 18), "Qi"],
		[math_e(1, 21), "Sx"],
		[math_e(1, 24), "Sp"],
		[math_e(1, 27), "Oc"],
		[math_e(1, 30), "No"],
		[math_e(1, 33), "Dc"],
		[math_e(1, 36), "Ud"],
		[math_e(1, 39), "Dd"],
		[math_e(1, 42), "Tc"]
	];

	if (scientific)
	{
		// Scientific
		var exponent = floor(log10(val));
		var mantissa = val / (math_e(1, exponent));
		return string(mantissa) + "e" + string(exponent);
		//return string_format("%.2fe%d", mantissa, exponent);
	} else {

		// Suffix
		for (var i = array_length(suffixes); i > 0; i--)
		{
			var suffix = suffixes[i - 1];
			if (string(suffix) == "") break;
			var limit = suffix[0];
			var key = suffix[1];

			if (val >= limit)
			{
				var scaled = round(val / limit);
				return string(scaled) + key;
			};
		};
		
		return string(val);
	};
}