function suffix_time(seconds, mode){
	var _units = [ [86400, "d"], [3600, "h"], [60, "m"], [1, "s"] ];
	var _remaining = max(0, seconds);
	var _s, _m, _h, _d
	var _result = "";
	
	for (var i = 0; i < 4; i++)
	{
		var _unit = _units[i];
		if (string(_unit) == "") { break; };
		if (_remaining > _unit[0])
		{
			var _count = floor(_remaining / _unit[0]);
			_remaining -= (_count * _unit[0]);
			_result += string(_count) + _unit[1] + " ";
			if (mode == "single") { break; };
		};
	};
	
	return _result;
}