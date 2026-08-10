# helper.py

def generate_story(animal, food, place):
    
    if animal.lower() == "cat":
        mood = "grumpy"
    elif animal.lower() == "dog":
        mood = "hyper"
    else:
        mood = "funny"
        
    story = f"Once upon a time, a {mood} {animal} went to the {place}. It was very hungry and decided to eat {food} for lunch."
    return story

def save_story_to_file(story_text):
    
    file_name = "my_adventure.txt"
    with open(file_name, "w") as file:
        file.write(story_text)
    print(f"\nSuccess: Your story has been saved to {file_name}!")
