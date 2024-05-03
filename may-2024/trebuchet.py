# test data
input_strings = ["1abc2", "pqr3stu8vwx", "a1b2c3d4e5f", "treb7uchet"]
digits = ["0","1","2","3","4","5","6","7","8","9"]

# load the file:

def load_file_lines(filename):
    lines = []
    file = open(filename)
    for line in file:
        lines.append(line.rstrip("\n"))
    file.close()
    return lines

datas = load_file_lines("./data/data.txt")

def are_you_a_digit(some_character):
    if some_character in digits:
           return True
    else: 
           return False

# given a string, return the first digit
def get_first_digit(word):
    # loop round the word, are you a digit?
    for character in word:
        if are_you_a_digit(character) == True:
                return character

# given a string, return the last digit
def get_last_digit(word):
    # loop round the word, are you a digit?
    for character in word[::-1]:
        if are_you_a_digit(character) == True:
                return character

# given a string, return first and last digits combined
# def get_first_and_last_digits_combined(word):
#     return int(get_first_digit(word) + get_last_digit(word))

def get_first_and_last_digits_combined(word):
    # get all characters, and only return the digit ones
    just_digits = [
         letter
         for letter in word
         if letter in digits
	]
    return int(just_digits[0] + just_digits[-1])
	# "1" "5"
    # "15"
    # 15
	# grab first and last and "num" them

# sum all the numbers, return the sum
def sum_of_numbers_in_words(list_of_words):
      list_of_numbers = [
           get_first_and_last_digits_combined(word)
			for word in list_of_words
	  ]
     
      return sum(list_of_numbers)

print(sum_of_numbers_in_words(datas))

