from PyScientificCalculations import tan, sin, cos

import os


if os.path.exists("HamptonUrocks.txt"):
    os.remove("HamptonURocks.txt")

with open('HamptonURocks.txt', 'w') as file:
    file.write("The Pirates are on Fire!")
    file.close()
print("File HamptonURocks.txt created and text written successfully.")

# This function adds two numbers
def add(x, y):
    return x + y

# This function subtracts two numbers
def subtract(x, y):
    return x - y

# This function multiplies two numbers
def multiply(x, y):
    return x * y

# This function divides two numbers
def divide(x, y):
    return x / y

while True:
    print("Select operation.")
    print("1.Add")
    print("2.Subtract")
    print("3.Multiply")
    print("4.Divide")
    print(" ")
    print("Scintific calculations")
    print("5.Tangent")
    print("6.Cosine")
    print("7.Sine")


    # take input from the user
    choice = input("Enter choice(1/ 2/ 3/ 4/ 5/ 6/ 7): ")

    # check if choice is one of the four options
    if choice in ('1', '2', '3', '4', '5', '6', '7'):
        try:
            num1 = float(input("Enter first number: "))
            if choice in ('1', '2', '3', '4'):
                num2 = float(input("Enter second number: "))
        except ValueError:
            print("Invalid input. Please enter a number.")
            continue

        if choice == '1':
            print(num1, "+", num2, "=", add(num1, num2))

        elif choice == '2':
            print(num1, "-", num2, "=", subtract(num1, num2))

        elif choice == '3':
            print(num1, "*", num2, "=", multiply(num1, num2))

        elif choice == '4':
            if num2 == 0:
                print("Cannot divide by zero!")
            else:
                print(num1, "/", num2, "=", divide(num1, num2))
        elif choice == '5':
            print("tan of tan(", num1, "=", tan(num1))
        elif choice == '6':
            print("tan of cos(", num1, "=", cos(num1))
        elif choice == '7':
            print("tan of sin(", num1, "=", sin(num1))
        
        # check if user wants another calculation
        # break the while loop if answer is no
        next_calculation = input("Let's do next calculation? (yes/no): ")
        if next_calculation == "no":
          break
    else:
        print("Invalid Input")