# Capstone_project

 The design goal of this lab is to demonstrate the ability to clone a repository, create a feature branch, make code changes and succesfully recognize and mitigate common git mistakes.

Technical Requirements
Repository Setup:

● Create a brand-new GitHub repository from scratch (no templates).

● Repository must include:

 ○ .README.md

 ○ .gitignore (appropriate for Python)

 ○ At least 2 Python files (.py) per student


Each team member must:

1. Clone the repository locally

2. Create their own Git branch
   
   ○ Naming convention (recommended):

  feature/Name-function


3. Write at least two Python files with the following code concepts
implemented

  ○ Static and dynamic variables
 
  ○ User input
 
  ○ File creation
 
  ○ Conditional Logic

   

5. Commit their work to their branch

6. Push their branch to GitHub

7. Open a Pull Request (PR)

8. Participate in resolving merge conflicts (if any)

Creating a Branch Using Command Line

  Clone the Repository: If you haven't already, clone the repository to your local machine using the command:

               git clone repository-url
   
   Navigate to the Repository Directory: Change to the repository directory using the cd command:

               cd repository-directory
   
   Create a New Branch: Use the git checkout command to create and switch to a new branch:

               git checkout -b your-new-branch-name
   
   Push the Branch to GitHub: Push the new branch to the remote repository using:

               git push -u origin your-new-branch-name

Troubleshooting;
 collaberators must be given access to the repo from github, before they can add to the repo.
 From the repo go to settings---->Collaborators: Enter the Email, assoc with each collabs git account: add
 Git will send an email that has to be accepted

Troubleshooting;
 User github account was not authenticated
 If you're using HTTPS with GitHub, the person pushing usually needs a Personal Access Token (PAT) for their own GitHub account.
 Typical setup
 Each team member has their own GitHub account.
 Each team member creates their own PAT (or uses SSH keys).
 They authenticate using their own credentials when pushing.


----
### Chris Capstone Labs

   Python app 1 Registration_validator.py

         A simple Vehicle registration Calculator. 
            Request Inputs Make, Model, Registration Dates.

            Condidtional = If age is greater than two years past the current Date
            Return = Registration expired

   Python app 2 Ext_vehicle_warranty.py
   
         Checks your vehicle specs to qualify you for an extended warranty
            Request Inputs Production Year, Current year, Miles
         
            Conditional = If mileage is less the age * 10K
            Return = You Qualify for an extended Warranty

   Both apps are Initiated By app.py

   Lab2 EC2 Script is in Chris_lab2 folder
   Screenshots and Artifacts are in Chris_Artifacts folder

  
  

---

### Eirik's Lab 1 project

My project (located in the branch feature/eirik-function) is broken down by labs. In lab1, where we are now, we have my Python project, a 7 function calculator. 

The calculator is a combination of  regular arithmetic calculator with 3 scienfitific computations featured.
-  Addition
- Subtraction
- Multiplication
- Division

Scientific functions
- Tangent
- Sine
- Cosine

The calculator is split between two files, PythonCalc.py and PythonScientific.py. PythonCalc serves as the main body and executor of the application. A menu is presented to show the user the options available to them.

The latter are in their own file (PythonScientific.py) and are called via function from PythonCalc.

I added app.py to make a subprocess call to PythonCalc.py. The file app.py generates conflicts. One solution is to utilize my app5.py per group suggestion and that fixed the merge issues for the main branch.

Screenshots are located in Eirik-Artifacts/1.2.1_Visuals.

Lab2 has a verbose writeup located in its directory, Eirik-lab2.

---

### Samael Capstone Lab-1:

**Python App: Story Time (app1.py)**
This is an interactive Python application that prompts the user for inputs such as an animal, a food item, and a place to generate a fun, silly story. It also gives the option to save the generated story to a text file.

**Launch Instructions:**
This application is initiated by running `app1.py`. 
To launch, run the following command in your terminal:
`python app1.py`

**Python App 2: Greetings & Access Logger (app11.py)**
An interactive utility that prompts for a username and role, applies access controls via conditional logic, and appends a timestamped session record to a text log file.
*Launch Instructions:* `python app11.py`
