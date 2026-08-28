# app11.py
import datetime

def main():
    
    SYSTEM_NAME = "Cloud Greeting & Access Logger"
    
    print(f"=== {SYSTEM_NAME} ===")
    
    
    user_name = input("Enter your username: ").strip()
    role = input("Enter your role (Admin/Dev/User): ").strip().lower()
    
    current_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    
    if role == "admin":
        access_level = "Full Administrative Access"
        greeting = f"Welcome, Administrator {user_name}! System parameters unlocked."
    elif role == "dev":
        access_level = "Developer Access"
        greeting = f"Welcome, Developer {user_name}! Repository access granted."
    elif role == "user":
        access_level = "Standard Read-Only Access"
        greeting = f"Hello {user_name}! Standard dashboard initialized."
    else:
        access_level = "Guest Access"
        greeting = f"Hello {user_name}! Limited access granted."
        
    print(f"\n{greeting}")
    print(f"Assigned Level: {access_level}")
    
    
    log_filename = "greeting_access_log.txt"
    with open(log_filename, "a") as log_file:
        log_file.write(f"[{current_time}] User: {user_name} | Role: {role} | Level: {access_level}\n")
        
    print(f"Session logged successfully to {log_filename}.\n")

if __name__ == "__main__":
    main()
