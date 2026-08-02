def run_warranty():
    prod_Year = int(input("Enter year of vehicle produced: "))
    current_year = int(input("Enter the current year:"))
    make = input("Enter make of vehicle: ")
    model = input("Enter model of vehicle: ")
    miles = int(input("How many miles on the odometer:"))

    age = current_year - prod_Year

    print (age * 10000)

    if miles < age * 10000:
        print(f"Your {model} qualify for an extended vehicle warranty")

        file = open("Promotional.txt", "w")
        file.write(f"Register your {model} now and receive 30% off")
        file.close()

        print("Promotional offer saved to Promotional.txt")

    else:
        print(f"At this time your {model} does not qualify for an extended warranty")