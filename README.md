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

  feature/Chris-function

 Creating a Branch Using Command Line

  Clone the Repository: If you haven't already, clone the repository to your local machine using the command:

   git clone repository-url
   
   Navigate to the Repository Directory: Change to the repository directory using the cd command:

   cd repository-directory
   
   Create a New Branch: Use the git checkout command to create and switch to a new branch:

   git checkout -b your-new-branch-name
   
   Push the Branch to GitHub: Push the new branch to the remote repository using:

   git push -u origin your-new-branch-name

3. Write at least two Python files with the following code concepts
implemented

  ○ Static and dynamic variables
 
  ○ User input
 
  ○ File creation
 
  ○ Conditional Logic

   Python app 1 app.py
   A simple Vehicle registration Calculator. 
   Request Make, Model, Registration Date. 
   Condidtional = If age is greater than two years past the current Date
   Return = Registration expired

   Python app 2 audit.py
   Checks your vehicle specs to qualify you for an extended warranty

5. Commit their work to their branch
6. Push their branch to GitHub
7. Open a Pull Request (PR)
8. Participate in resolving merge conflicts (if any)

mistake 1;
 collaberators must be given access to the repo from github, before they can add to the repo.
 From the repo go to settings---->Collaborators: Enter the Email, assoc with each collabs git account: add
 Git will send an email that has to be accepted
 
Mistake2;
 User github account was not authenticated
 If you're using HTTPS with GitHub, the person pushing usually needs a Personal Access Token (PAT) for their own GitHub account.
 Typical setup
 Each team member has their own GitHub account.
 Each team member creates their own PAT (or uses SSH keys).
 They authenticate using their own credentials when pushing.
