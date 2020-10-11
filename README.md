# QAC SFIA2 Practical Project

For this project we were tasked with deploying a prebuilt flask application. Said application consisted of a webpage showing entries from a mysql database, and a backend written in python. The deployment of this app required me to utilise most of what I have learnt in the academy up until this point. The main technologies used were: Ansible, AWS EC2, AWS RDS, Docker and Docker-Compose, Jenkins, Kubernetes and Terraform. 

## Contents

  - Project Infrarstructure
  -

## Planning
As with every project a great deal of time is spent on planning and preperation, this ensures the project runs smoothly and allows the developer to stay on track having a list they can go back to monitoring their progress. 

### Risk Assessment
As with all projects there are always apparent risks, no matter how small they might be. With this project in particular there is no greate amount of data being stored and not a great deal of thing sthat could go wrong, howvere if this is scaled up issues could become apparent more quickly. Below are some risks that I have identified:
![risk assessment](https://i.imgur.com/R06k1Z6.png)

### Jira Board
The Jira board helped with noting what my progress was throughout the course of this project, being able to move tasks from the 'to do' section into the completed section was a great relief, seeing such a large list dilute rather quickly. 
![Jira Board](https://i.imgur.com/zIr04ll.png)

## Project Infrarstructure
As directed by the MVP, the project is set up in a way of being as automated as possible. Terraform is utilised to create an EC2 instance and two RDS databases. Ansible is then applied to install jenkins on the vm which was created. A webhook was utilised which allowed me to have the jenkins pipeline triggered as soon as a commit was made to the source code provider (github). Once Jenkins is triggers it builds the project in a testing environment, permitting it reaches 100% in the tests it then builds the project in a live environment, with Kubernetes being applied to deploy the application.

## Brief

The application must:

- Be deployed to a **Virtual Machine for testing**
- Be deployed in a **managed Kubernetes Cluster for production**
- Make use of a **managed Database solution**

## Application

The application is a Flask application running in **2 micro-services** (*frontend* and *backend*).  

The database directory is available should you: 
  - want to use a MySQL container for your database at any point, *or*
  - want to make use of the `Create.sql` file to **set up and pre-populate your database**.

The application works by:
1. The frontend service making a GET request to the backend service. 
2. The backend service using a database connection to query the database and return a result.
3. The frontend service serving up a simple HTML (`index.html`) to display the result.



## Infrastructure

The **Minimum Viable Product** for this project should at least demonstrate the following infrastructure diagram:

![mvp-diagram](https://i.imgur.com/i5qfOas.png)


