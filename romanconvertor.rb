
def fromRoman(roman_numeral)
  raise TypeError if roman_numeral == /[a-z]/

  final_arabic_number = 0
  index = 0

  while index < roman_numeral.length

    first_roman_numeral = value_of_each_numeral roman_numeral[index]

    if index + 1 < roman_numeral.length
      second_roman_numeral = value_of_each_numeral roman_numeral[index + 1]

      if first_roman_numeral >= second_roman_numeral
        final_arabic_number += first_roman_numeral
        index += 1
      else
        final_arabic_number += second_roman_numeral - first_roman_numeral
        index += 2
      end
    else
      final_arabic_number += first_roman_numeral
      index += 1
    end
  end
  final_arabic_number
end

def toRoman(arabic_number)
  raise RangeError if (arabic_number < 1) or (arabic_number > 3999)

  final_roman = ''
  while arabic_number != 0
    if arabic_number >= 1000
      arabic_number -= 1000
      final_roman.concat('M')
    elsif arabic_number >= 900
      arabic_number -= 900
      final_roman.concat('CM')
    elsif arabic_number >= 500
      arabic_number -= 500
      final_roman.concat('D')
    elsif arabic_number >= 400
      arabic_number -= 400
      final_roman.concat('CD')
    elsif arabic_number >= 100
      arabic_number -= 100
      final_roman.concat('C')
    elsif arabic_number >= 90
      arabic_number -= 90
      final_roman.concat('XC')
    elsif arabic_number >= 50
      arabic_number -= 50
      final_roman.concat('L')
    elsif arabic_number >= 40
      arabic_number -= 40
      final_roman.concat('XL')
    elsif arabic_number >= 10
      arabic_number -= 10
      final_roman.concat('X')
    elsif arabic_number >= 9
      arabic_number -= 9
      final_roman.concat('IX')
    elsif arabic_number >= 5
      arabic_number -= 5
      final_roman.concat('V')
    elsif arabic_number >= 4
      arabic_number -= 4
      final_roman.concat('IV')
    elsif arabic_number >= 1
      arabic_number -= 1
      final_roman.concat('I')
    end
  end
  final_roman
end

def value_of_each_numeral (roman_numeral)
  if roman_numeral == 'I'
    1
  elsif roman_numeral == 'V'
    5
  elsif roman_numeral == 'X'
    10
  elsif roman_numeral == 'L'
    50
  elsif roman_numeral == 'C'
    100
  elsif roman_numeral == 'D'
    500
  elsif roman_numeral == 'M'
    1000
  else
    0
  end
end