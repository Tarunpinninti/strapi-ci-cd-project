# DevOps Internship – Task 1  
## Strapi CMS Setup, Exploration & Content Type Creation

This repository contains my work for **Task 1** of the PearlThoughts DevOps Internship program.  
The objective of this task is to understand Strapi, set it up locally, explore its structure, create a sample content type, and push the complete setup to GitHub.

## **Task Objectives**

- Clone the official Strapi repository  
- Run Strapi locally  
- Explore Strapi project folder structure  
- Start the Strapi Admin Panel  
- Create a sample content type  
- Push the Strapi setup to GitHub  
- Document steps in a README  
- Record a Loom walkthrough video

## **Cloned the Official Strapi Repository**

Although the official Strapi repository cannot be run directly (it is a monorepo with workspaces), cloning helped see the structure.
                  
                  git clone https://github.com/strapi/strapi
Note: This step is for understanding source code, not for running the CMS.

## Created a New Strapi Project (Local Setup)

To run Strapi locally, I created a new Strapi project using the recommended command:
 
     npx create-strapi-app@latest strapi-task1 --quickstart --skip-cloud

This command:

Generates a full Strapi project

Installs all dependencies

Creates a SQLite database

Starts the server automatically

## Started the Strapi Server
Inside the project folder:

    npm run develop
Strapi launched successfully at:

🔗 http://localhost:1337/admin

## Created the Admin User

On first launch, Strapi asked me to create an administrator account to access the dashboard.

## Explored Strapi Project Folder Structure

Strapi generates a well-organized folder structure:

Folder	Description:

/src	      = Contains main application code

/src/api	  = Includes auto-generated APIs for each content type

/config	    = Environment and server configuration

/public	   =  Static files served to the client

/.tmp	     = Local SQLite database & temporary build files

/dist	     = Compiled files after building the admin panel

## Created a Sample Content Type

Using the Content-Type Builder, I created a collection type:

Collection Type: Product

Fields included:

name (Text)

price (Number)

description (Text)

Strapi automatically generated:

Controllers

Routes

Services

Schema files

Located in:
/src/api/product

## Pushed the Project to GitHub

    git init
    git add .
    git commit -m "Task 1 - Strapi setup completed"
    git branch -M main
    git remote add origin https://github.com/Tarunpinninti/strapi-task1.git

This line was added to create a Pull Request for Task-1.
