# app.py
from helper import generate_story, save_story_to_file

print("Let's create a silly story together!")
print("Answer the questions and I will make a funny sentence.\n")

animal = input("Enter an animal (like dog or cat): ")
food = input("Enter a food you like (like pizza or apples): ")
place = input("Enter a fun place (like park or school): ")

final_story = generate_story(animal, food, place)

print("\nHere is your story:")
print("-" * 20)
print(final_story)
print("-" * 20)

save_choice = input("\nWould you like to save this story to a text file? (yes/no): ")
if save_choice.lower() == "yes":
    save_story_to_file(final_story)
else:
    print("What a silly adventure! The end.")
