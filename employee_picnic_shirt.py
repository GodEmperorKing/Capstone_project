def picnic_shirt_color():
 first_name = input("Enter employee first name: ")
 last_name = input("Enter employee last name: ")

 first_letter = last_name[0].upper()

 if first_letter >= "A" and first_letter <= "E":
    shirt_color = "White"

 elif first_letter >= "F" and first_letter <= "K":
    shirt_color = "Red"

 elif first_letter >= "L" and first_letter <= "P":
    shirt_color = "Blue"

 elif first_letter >= "Q" and first_letter <= "U":
    shirt_color = "Black"

 elif first_letter >= "V" and first_letter <= "Z":
    shirt_color = "Green"

 else:
    shirt_color = "Invalid"

 print("Your t-shirt color is", shirt_color)

 file = open("shirt-color.txt", "w")
 file.write("Employee Last Name: " + last_name + "\n")
 file.write("Shirt Color: " + shirt_color + "\n")
 file.close()

 print("Shirt color saved to shirt-color.txt")