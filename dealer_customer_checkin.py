def customer_checkin():
 first_name = input("Enter customer first name: ")
 last_name = input("Enter customer last name: ")
 vehicle_year = int(input("Enter vehicle year: "))
 vehicle_make = input("Enter vehicle make: ")
 vehicle_model = input("Enter vehicle model: ")

 first_name_length = len(first_name)
 last_name_length = len(last_name)

 total_letters = first_name_length + last_name_length

 last_letter = last_name[-1].lower()

 customer_id = str(total_letters) + last_letter + str(vehicle_year)

 print("Customer ID:", customer_id)

 if vehicle_year < 1995:
    print("This vehicle is older than 30 years old.")
 else:
    print("This vehicle is less than 30 years old.")
    
 file = open("customer-id.txt", "w")
 file.write("Customer Name: " + first_name + " " + last_name + "\n")
 file.write("Customer ID: " + customer_id + "\n")
 file.close()

 print("Customer ID saved to customer-id.txt")