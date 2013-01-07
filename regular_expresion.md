# regular expresion
### time format
* frac .[0-9]+
* hh "0"?[1-9]|"1"[0-2]
* HH [01][0-9]|"2"[0-4]
* meridian [AaPp].?[Mm].?[0\t]
* MM [0-5][0-9]
* II [0-5][0-9]
* space [\t]
* tz "("?[A-za-z]{1,6}")"?|[A-Z][a-z]+([_/][A-Z][a-z]+)+
* tzcorrection "GMT"?[+-]hh":"?MM?
### 12 Hour Notation
* Hour only, with meridian
		
		hh space? meridian
		
* Hour and minutes, with meridian

		hh[.:]MM space? meridian

* Hour, minutes and seconds,with meridian

		hh[.:]MM[.:]II space ? meridian

* MS SQL(Hour, minutes, seconds and fraction with meridian), PHP 5.3 and later only

		hh ":" MM ":" II [.:] [0-9]+ meridian
		
### 24 Hour Notation
* Hour and minutes

		"t"?HH[.:]MM

* Hour and minutes, no colon

		"t"?HH MM

* Hour, minutes and seconds

		"t"?HH[.:]MM[.:]II

* Hour, minutes and seconds, no colon

		"t"?HH MM II

* Hour, minutes, seconds and timezone

		"t"?HH[.:]MM[.:]II space? (tzcorrection|tz)

* Hour, minutes, seconds and fraction

		"t"?HH[.:]MM[.:]II frac

* Time zone information

		tz|tzcorrection
		
### Date Format
* daysuf "st"|"nd"|"rd"|"th"
* dd ([0-2]?[0-9]|"3"[01])daysuf?
* DD "0"[0-9]|[1-2][0-9]|"3"[01]
* m "january"|"february"|"march"|"april"|"may"|"june"|"july"|"august"|"september"|"october"|"november"|"december"|"jan"
* M 'jan'|'feb'|'mar'|'apr'|'may'|'jun'|'jul'|'aug'|'sep'|'oct'|'nov'|'dec'
* mm "0"?[0-9]|"1"[0-2]
* MM "0"[0-9]|"1"[0-2]
* y [0-9]{1,4}
* yy [0-9]{2}
* YY [0-9]{4}