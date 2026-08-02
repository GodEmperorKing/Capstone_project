def run_registration():

    year = int(input("Enter age of vehicle: "))
    make = input("Enter make of vehicle: ")
    model = input("Enter model of vehicle: ")
    color = input("Enter color of vehicle: ")
    current_year = int(input("Enter current year:"))
    current_month = int(input("Enter current month:"))
    registration_year = int(input("Enter registration year of vehicle: "))
    registration_month = int(input("Enter registration month of vehicle: "))
    registration_age = current_year - registration_year 


    print("registration age: ", registration_age)


    if registration_age >= 2 and current_month >= registration_month:
        print("Your registration has expired")

    else:
        print(f"Your {model} registration is valid")
        file = open("Registration.txt", "w")
        file.write("Vehicle Registration: " + make + " " + model +"\n")
        file.write("Renewed: " + current_year + "\n")
        file.close()
        print("vehicle registration saved to registration.txt")