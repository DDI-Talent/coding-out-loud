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
            return data_read
            
        
    
    def show_secret(self):
        return self.secret
    
    
    
        
    
    