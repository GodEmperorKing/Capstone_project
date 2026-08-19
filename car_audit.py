prod_Year = int(input("Enter year of vehicle produced: "))
current_year = int(input("Enter the current year:" \
""))
make = input("Enter make of vehicle: ")
model = input("Enter model of vehicle: ")
miles = int(input("How many miles on the odommeter:"))


age= prod_Year-current_year

if miles > age * 10:
 print(f"Your {model} qualify for an extended vehicle warranty")
else:
   print(f"At this time your {model} does not qualify for an extended warranty")

