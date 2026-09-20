
/// @function						suffix_time(seconds, mode, false);
///	@param {number}		seconds		The amount to format.
/// @param {string}		mode		timer, full or default.
/// @param {boolean}	single		If it should display only the highest value or not.
/// @description					Turns the input into a readable time format.
function suffix_time(seconds, mode = "default", single = false){
	var _units = [ [86400, "d", "Day"], [3600, "h", "Hour"], [60, "m", "Minute"], [1, "s", "Second"] ];
	var _remaining = max(0, seconds);
	var _result = "";
	
	for (var i = 0; i < 4; i++)
	{
		var _unit = _units[i];
		if (string(_unit) == "") { break; };
		if (_remaining > _unit[0])
		{
			var _count = floor(_remaining / _unit[0]);
			_remaining -= (_count * _unit[0]);

			if (mode == "timer")
			{
				if (_result == "") { _result += string(_count); } else { _result +=  ":" + string(_count); };
			};

			if (mode == "full")
			{
				if (_count == 0 || _count == 1) {
					_result += string(_count) + _unit[2] + " ";
				} else {
					_result += string(_count) + " " + _unit[2] + "'s ";
				};
			};
			
			// Default / Not mode set
			if (mode == "default")
			{
				_result += string(_count) + _unit[1] + " ";
			}

			if (single) { break; };
		};
	};

	return _result;
}