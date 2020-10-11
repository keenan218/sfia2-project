# QAC SFIA2 Practical Project

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/a30d4a530d4d4c78995d77083cd6888a)](https://app.codacy.com/gh/keenan218/sfia2-project?utm_source=github.com&utm_medium=referral&utm_content=keenan218/sfia2-project&utm_campaign=Badge_Grade)

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

### Ansible
Ansible was utilised in this project to download java and jenkins onto the Jenkins EC2 instance. This allows a quick set up of the jenkins service as i am able to run one command and it downloads to a specified vm and returns the jenkins admin password required for me to log on to jenkins and proceed in setting up my pipeline. Due to time restraints ansible wasn't utilised to its fullest potential, with a manual set up of Docker, docker-compose and a jenkins user still required after the ansible job has been played. 

### Docker & docker-compose
Docker and docker-compose (DC) are utilised to containerise the deployment of the project, backend, frontent, mysql and nginx are all split nto their seperate containers. DC is utilised to build the application in both the testing environment and the live environment. 

### Jenkins

### Kubernetes

### Terraform

## Project Deployment 

## Brief

The application must:

- Be deployed to a **Virtual Machine for testing**
- Be deployed in a **managed Kubernetes Cluster for production**
- Make use of a **managed Database solution**

## Application
![mvp-diagram](https://i.imgur.com/i5qfOas.png)


