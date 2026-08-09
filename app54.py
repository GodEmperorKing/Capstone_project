from dealer_customer_checkin import customer_checkin
from employee_picnic_shirt import picnic_shirt_color

print("Program Selection")
print("1. Dealer Customer Check-In")
print("2. Employee Picnic Shirt")

selection = input("Enter your selection: ")

if selection  == "1":
    customer_checkin()
elif selection == "2":
    picnic_shirt_color()
else:
    print("Invalid choice.")