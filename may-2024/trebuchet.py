input_strings = ["1abc2", "pqr3stu8vwx", "a1b2c3d4e5f", "treb7uchet"]
digits = ["0","1","2","3","4","5","6","7","8","9"]

def are_you_a_digit(some_character):
    if some_character in digits:
           return True
    else: 
           return False

# print(are_you_a_digit("z")) #False
# print(are_you_a_digit("7")) #True
# print(are_you_a_digit("r")) #False
# print(are_you_a_digit("0")) #True



# given a string, return the first digit
def get_first_digit(word):
    # loop round the word, are you a digit?
    for character in word:
        if are_you_a_digit(character) == True:
                return character

print(get_first_digit("1abc2")) # 1
print(get_first_digit("pqr3stu8vwx")) #3
print(get_first_digit("a1b2c3d4e5f")) #1
# assert get_first_digit("1abc2") == 1

# given a string, return the last digit

# given a string, return first and last digits combined

# string to number

# sum all the numbers, reurn the sum













































# expected_output_numbers = [12,38,15,77]
