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
        self.guesses = [ ]
        # self.leftover_words = self.all_words
              
    def load_basic_english_words(self):
        with open("xkcd_simple_words.csv") as file:
            reader = csv.reader(file, delimiter=",", quotechar='"')
            data_read = next(reader) #grab first line
            #    TODO: only keep words 5 letter long       
            return data_read
    
    def start(self):
        self.reset_game()
        print(self.all_words)
        
    


    
    
    
        
    
    