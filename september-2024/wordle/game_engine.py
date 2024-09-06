import csv
import random

# allow user to input a guess, which we then check
# loop so people can do it until they guess
# pick random secret from big set

# pick which words are still valid
# make computer play the game itself

class Game:
    
    def __init__(self):
        self.guesses = []
        self.max_guesses = 6
        self.game_won = False
        self.all_words = self.load_basic_english_words()

    def load_basic_english_words(self):
        with open("xkcd_simple_words.csv") as file:
            reader = csv.reader(file, delimiter=",", quotechar='"')
            data_read = next(reader) 
  
            words_to_keep = []
            
            for word in data_read:
                if len(word) == 5:
                    words_to_keep.append(word) 
            
            return words_to_keep
      
    def start(self):
        self.reset_game()
        
        while len(self.guesses) < self.max_guesses:
            guess = input("Make a guess:\n")
            self.guesses.append(guess)
            print(self.check_word(guess))
            
            if self.secret in self.guesses:
                break
            
    def reset_game(self):
        self.secret = random.choice(self.all_words)
        self.guesses = []
            
    
    def get_feeback(self, guess):
        feedback = ""
        for index in range(0, 5):
                if guess[index] == self.secret[index]:
                    feedback += "+"
                elif guess[index] in self.secret:
                    feedback += "?"
                else:
                    feedback += "-"
        return feedback
    
    def check_word(self, guess):
        #   turne a guess into a 5 letter feedback, eg for secret lucky, feedback for plumy will be -??-+      
        feedback = self.get_feeback(guess)
        if feedback == "+++++":
            message = f"Win! You guessed {guess}, the word is {self.secret}"
        else:
            message = f"You guessed {guess}\nfeedback is {feedback}"
            message += f"\nsecret is   {self.secret}" # TODO: remove this when done
            
        return message
            
        
    
    def show_secret(self):
        return self.secret
    
    
    
        
    
    