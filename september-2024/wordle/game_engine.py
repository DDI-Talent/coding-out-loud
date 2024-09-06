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
        self.leftover_words = self.all_words
    
    
    def words_that_fit_feedback(self,guess):
#         apple
#         ++?--
        feedback = self.get_feedback(guess)

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

    #     overlap
        self.leftover_words  = set(allowed_words_for_feedbacks[0]) & set(allowed_words_for_feedbacks[1]) & set(allowed_words_for_feedbacks[2]) & set(allowed_words_for_feedbacks[3]) & set(allowed_words_for_feedbacks[4]  )

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
    
    def best_word(self):
        return random.choice( list(self.leftover_words) )
        
        
    def auto_play(self):
        scores = []
        for which_go in range(10000):
            self.reset_game()
            while len(self.guesses) < self.max_guesses and not (self.secret in self.guesses):
                guess = self.best_word()
                self.guesses.append(guess)
                self.words_that_fit_feedback(guess)
                feedback = self.get_feedback(guess)
                # print(feedback)
                # print(self.get_feedback_for_humans(guess))
            scores.append(len(self.guesses))
        print(f"on average you win every { sum(scores) / len(scores)}")
#  
    
    
    def start(self):
        self.reset_game()
        
        
        while len(self.guesses) < self.max_guesses and not (self.secret in self.guesses):
            guess = input("What's your guess? ")
            self.guesses.append(guess)
            self.words_that_fit_feedback(guess)
            feedback = self.get_feedback(guess)
            print(feedback)
            print(self.get_feedback_for_humans(guess))
#  
    
    
#    ("antil")  "apple" -> "+--?-"
    def get_feedback(self, guess):
        feedback = ""
        for index in range(0,5): #[0,1,2,3,4]
            if guess[index] == self.secret[index]:
                feedback += "+"
            elif guess[index] in self.secret: #and guess[index] != self.secret[index] 
                feedback += "?"
            else:
                feedback += "-"
        return feedback
        
        

    def get_feedback_for_humans(self, guess):
        feedback = self.get_feedback(guess)
        if feedback == "+++++":
            return f"You Win! Secret was {self.secret}, you guessed in {len(self.guesses)}"
        else:
            return f"You guessed   {guess}\nyour feedback {feedback}\nleftover words are {self.leftover_words}"
    


    
    
    
        
    
    