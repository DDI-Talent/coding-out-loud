import csv
import random

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
      
    
    def play_itself(self, this_many_times = 1):
        scores = []
        for which_turn in range(this_many_times):
            self.reset_game()
            while True:
                guess = random.choice(list(self.leftover_words))
                self.guesses.append(guess)
                self.words_that_fit_feedback(guess)
                # print(self.check_word(guess))
                if self.secret in self.guesses:
                    print(f"it took you {len(self.guesses)} guesses")
                    scores.append(len(self.guesses))
                    break
        print(f"average score was {sum(scores) / len(scores)}")
    
    
    
    def start(self):
        self.reset_game()
        
        while len(self.guesses) < self.max_guesses:
            guess = input("Make a guess:\n")
            self.guesses.append(guess)
            self.words_that_fit_feedback(guess)
            print(self.check_word(guess))
            
            if self.secret in self.guesses:
                break
            
    def reset_game(self):
        self.secret = random.choice(self.all_words)
        self.guesses = []
        self.leftover_words = self.all_words
            
    def words_that_fit_feedback(self,guess):
#         apple
#         ++---
        feedback = self.get_feeback(guess)
        
        allowed_words_for_feedbacks = []
        
        for index in range(0,5):
            words_that_meet_feedback_item = [] #eg 'A' is at index 0
            if feedback[index] == "+": # letter is there!
#               keep words where letter A is at index 0
                for word in self.leftover_words:
                    if word[index] == guess[index]: 
                        words_that_meet_feedback_item.append(word)
            elif feedback[index] == "-": # letter not there
#               keep words where letter A is not there at all
                for word in self.leftover_words:
                    if not guess[index] in word: 
                        words_that_meet_feedback_item.append(word)
            elif feedback[index] == "?": # letter there, but elsewhere
                for word in self.leftover_words:
                    if guess[index] in word and word[index] != guess[index]: 
                        words_that_meet_feedback_item.append(word) 
                        
            allowed_words_for_feedbacks.append(words_that_meet_feedback_item)
            
            
        self.leftover_words  = set(allowed_words_for_feedbacks[0]) & set(allowed_words_for_feedbacks[1]) & set(allowed_words_for_feedbacks[2]) & set(allowed_words_for_feedbacks[3]) & set(allowed_words_for_feedbacks[4]  )
#         eg takes "+--+-" and returns. [word, word , word]
        
    
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
#             "there are still 345 possible valid guesses"
            message += f"\nsecret is   {self.secret}" # TODO: remove this when done
    
            message += f"\nleftover words {self.leftover_words}"
            
        return message
            
        
    
    def show_secret(self):
        return self.secret
    
    
    
        
    
    