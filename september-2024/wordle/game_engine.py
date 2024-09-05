class Game:
    
    def __init__(self):
        self.secret = "lucky"
        self.guesses = []
        self.all_words = ["apple", "grape", "plane", "spark", "light", "stone", "bread", "cloud", "flame", "water"]

    
    def show_secret(self):
        return self.secret
    
        
    
    