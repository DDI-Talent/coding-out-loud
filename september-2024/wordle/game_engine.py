import csv

class Game:
    
    def __init__(self):
        self.secret = "lucky"
        self.guesses = []
        self.all_words = ["apple", "grape", "plane", "spark", "light", "stone", "bread", "cloud", "flame", "water"]

    def load_basic_english_words(self):
        with open("xkcd_simple_words.csv") as file:
            reader = csv.reader(file, delimiter=",", quotechar='"')
            data_read = next(reader) 
            print(data_read)
#             just keep 5 letter words
            words_to_keep = []
            
            for word in data_read:
                if len(word) == 5:
                    words_to_keep.append(word) 
            
            return words_to_keep
      
    def check_word(self, guess):
        feedback = ""
        
        if guess == self.secret:
            feedback = f"Win! You guessed {guess}, the word is {self.secret}"
        else:
#             loop through one letter at a time, compare with secret
            for index in range(0, 5):
                if guess[index] == self.secret[index]:
                   feedback += "+"
                elif guess[index] in self.secret:
                    feedback += "?"
                else:
                    feedback += "-"
            
        return feedback
            
        
    
    def show_secret(self):
        return self.secret
    
    
    
        
    
    