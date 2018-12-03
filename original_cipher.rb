=begin 
Example:
	caesar_cipher("aBc!", 2)
	=> "cDe!"

PseudoCode:
	take a string and look each letter's character code on ascii
	add the number to the string's code, this is the total
		if the total exceeds 90 (uppercase letters) or 122 (lowercase letters), subtract 26 from it.
		if it doesn't, simply add the number and get the total
	return the encoded string, leaving punctuation and format the same
=end

def parse_code(charCode, newChar) #help method to deal with numbers larger than 26 (double looping of alphabet)
	if charCode.between?(65, 90)
		until newChar.between?(65, 90) 
			newChar -= 26
		end
	elsif charCode.between?(97, 122)
		until newChar.between?(97, 122)
			newChar -= 26
		end
	end
	return newChar
end

# def caesar_cipher(string, number)
# 	newString = ""
# 	stringArray = string.split("")
# 	i = 0
# 	while i < string.length
# 		charCode = stringArray[i].ord
# 		newChar = charCode + number #the new, shifted, character
# 		if charCode.between?(65,90) #for uppercase
# 			if newChar > 90
# 				newChar = parse_code(charCode, newChar)
# 			end
# 			newString += newChar.chr
# 		elsif charCode.between?(97,122) #for lowercase
# 			if newChar > 122
# 				newChar = parse_code(charCode, newChar)
# 			end
# 			newString += newChar.chr
# 		else 
# 			newString += charCode.chr
# 		end
# 		i += 1
# 	end
# 	p newString
# end

def caesar_cipher(string, number)
	return string.chars.map {|c|
		(number%26).times{c.next!} if c.ord.between?(65, 90) || c.ord.between?(97, 122)
		c[-1]
	}.join("")
end

# puts "enter a message to encrypt"
# string = gets.chomp
# p string

# puts "enter an encryption number"
# number = gets

# p caesar_cipher(string, number.to_i)

