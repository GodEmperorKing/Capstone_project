from Ext_vehicle_warranty import run_warranty
from Registration_Validator import run_registration

print("=== Extended Warranty Check ===")
warranty_result = run_warranty()
print(warranty_result)

print("\n=== Vehicle Registration Check ===")
registration_result = run_registration()
print(registration_result)

print("\n=== Summary ===")
print(warranty_result)
print(registration_result)


    
