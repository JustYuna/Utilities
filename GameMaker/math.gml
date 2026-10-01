/// @function						math_irandom_range(n1, n2);
///	@param {real}		n1			The low end of the range from wich the random number will be selected.
///	@param {real}		n2			The high end of the range from wich the random number will be selected.
/// @description					Resets random seed on every call making it random every time.
function math_irandom_range(n1, n2)
{
	randomise()
	return irandom_range(n1, n2);
};

/// @function						math_irandom(n);
///	@param {number}		n			The upper range from wich the random number will be selected.
/// @description					Resets random seed on every call making it random every time.
function math_irandom(n)
{
	randomise()
	return irandom(n);
};

/// @function						suffix_number(n, n2);
///	@param {number}		n1			The number before e.
/// @param {number}		n2			The number after e.
/// @description					Simplified to n1 e n2 (1e23) cause i cannot seem to find a native function for that.
function math_e(n1, n2)
{
	//var _resuult = real(string(n1) + "e" + string(n2));
	var _result = power(10, n2) * n1
	
	return _result;
};