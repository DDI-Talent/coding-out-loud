import csv
import random

# TODO: get_feedback?
# TODO: human feedback

class Game:
    
    def __init__(self):
        self.max_guesses = 6
        self.all_words = self.load_basic_english_words()

    def reset_game(self):
        self.secret = random.choice(self.all_words)
        self.guesses = []
        # self.leftover_words = self.all_words
              
    def load_basic_english_words(self):
        with open("xkcd_simple_words.csv") as file:
            reader = csv.reader(file, delimiter=",", quotechar='"')
            data_read = next(reader) #grab first line
            #    TODO: only keep words 5 letters long 
            
            words_to_keep = []
            
            for word in data_read:
                if len(word) == 5:
                    words_to_keep.append(word)
            
            return words_to_keep
    
    def start(self):
        self.reset_game()
        
        
        while len(self.guesses) < self.max_guesses:
            guess = input("What's your guess? ")
            self.guesses.append(guess)
            feedback = self.get_feedback(guess)
            print(feedback)
#  
    
        
    def get_feedback(self, guess):
        feedback = ""
        print(self.secret)
#         if it's the right word, return Win!
        
        if guess == self.secret:
            return "Win!"
        else:
            return "Try again"
    


    
    
    
        
    
    