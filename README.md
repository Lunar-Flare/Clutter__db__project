# Clutter
Demo Video: https://drive.google.com/file/d/14Qc3CyZo9hGkYfur2LOGRKm81AzTcUrD/view

## What is Clutter?
Clutter is a web-based organizational App that we had designed over 6 weeks and developed over 4 weeks. It is an all encompassing organizational app that is meant to allow users to keep track of most things they would need to keep track of.

## How Is it Used?
As a web-based software. With a dedicated GUI we focused a lot of time on the User Experience. Most functions are self defining and a user can easily work out what each sections purpose is.

## Our Team
- Jasmin Medic ([Jazz-jpg](https://github.com/Jazz-jpg))
- Rachel Yang ([Lunar-Flare](https://github.com/Lunar-Flare))

## Technologies Used
- Python 3.8
- Django Web Framework
- MySQL Database
- MySQl Workbench
- javaScript
- HTML/CSS
- BootStrap

## Problem Statement
We propose to develop an organizational solution that meets users orderly needs via web-application. Such that the implementation of a relational database will perform a crucial role in our software. The web-application will cover a broad range of use cases to match the requirements of our users. Our plan is to implement the following in our database; A contacts list consisting of family and friends, an expense and savings tracker, Task and memo lists, Notes list, Media watch list, and an event planner at a bare minimum. To reiterate, the purpose of this application is to provide users with an organizational solution that fits their lifestyle.

## Clutter Requirements
The Clutter database system will allow users to be able to create, update, manage, and store their personal data. As well as allowing them to view some of other users' data. Among this data we will have several different tables, including contact lists of friends and family, to-do lists involving tasks and memos, etc. With personalized information regarding those tables. Such as for example contact information would include, birthdays & location in the contacts list. All of this information will be viewable across the board to all users, and the data will be delivered to the user via a graphical user interface(GUI). As an aside we will throw in a little bit of fun in the form of inspirational quotes. Which will be randomly generated and stored in a table then displayed on the front page after log-in. The database's most important role will be to store and retrieve all these various sources of data and present it to the user. We do not plan to include a grocery list, calorie/fitness tracking, Weight loss goals.social media, recipes, and we will not support media file uploads in the forms of video or pictures.


## Database Conceptual Design
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/18.jpg)

## Functional Requirements
* Users can create an account
* Users can Log in
* Users can Log Out
* Users can Append to task list
* Users can checkmark a task
* Users can assosciate with contacts
* Users can Dissosciate with contacts
* Users can Pin a Memo to the page
* Users can Delete a memo
* Users can store media
* Users can edit media
* Users can Delete Media
* Users can manage Savings and Expenses
* Users can track events
* users can Search amongst a list of contacts
* Users can search Media


## Application Program Design
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/control.png)



# Screenshots

## Login
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/1.jpg)

## Create Account
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/2.jpg)

## Logout
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/3.jpg)

## Create Object
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/4.png)


## Read
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/5.jpg)

## Update
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/6.jpg)
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/7.png)



## Delete
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/8.jpg)
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/9.jpg)




# Application Tour

## Login page
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/10.jpg)


## App Bar
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/11.jpg)
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/12.jpg)



## Home
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/13.jpg)


## Contacts
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/14.jpg)


## Finances
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/15.jpg)

## Media
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/16.jpg)
![alt-text](https://github.com/Jazz-jpg/Clutter__db__project/blob/main/Screenshots/ClutterScreenshots/17.jpg)




## Install Guide

### Prerequisites
-	Windows 10 host

-	Browser of Choice

-	Text Editor of Choice

-	mySQL Community Edition

-	Python version 3.7 (recommended)

-	Python/Django Virtual Environment Setup

### Installation
  -	mySQL Community Edition download

●	https://dev.mysql.com/downloads/mysql/
●	Visit the website and download mySQL community edition,
●	Once downloaded follow the installation prompt when using the executable
●	Be sure to install all products while going through the execution prompts

### MySQl Server Setup
●	Launch mySQL workbench
●	Create a new workbench connection
●	Name the connection “mydb”
●	Enter your password and root user name be sure to remember these.(Optionally if you visit the settings file in the project you can use the given root user and password)
●	Launch your server and click File - > New Query Tab
●	On your desktop download the mySQL Scripts from the github link
●	Copy the Script and paste it in mySQL
●	Execute the script
●	Your database should now be good to go and ready to be utilized


### Text Editor Setup

●	Open your cloned github folder into your text editor of choice, we will be using Visual Studio in this example
●	Navigate to the settings.py folder and scroll until you see the database connection portion of the file
●	Change the NAME, USER, and PASSWORD settings with the information you had used to create your database.
●	Now that this is complete you can go setup the environment to run the application


### Environment Setup
●	Ensure your PC has both python and Django installed You can check this by navigating to your root directory and typing python --version, later when you navigate into the scripts file you can check the django version by launching python in the terminal and following these commands

○	>python

○	>Import django

○	>django.get_version()

●	download the repo and append the files into a new project app created within the django virtual env

●	Ensure that the Clutter_db.sql file and Clutter_db_all_files.sql are not in the folder take it out and place it somewhere else once you have setup the database
●	Open up your command terminal and navigate to the cloned repo folder

●	Navigate to the Scripts file in the command terminal and type in activate

●	Navigate back to the root folder and change directory into the clutter folder

●	At this point since your database does not have the authorization tables that django uses it would be a good idea to make migrations otherwise the user authentication will not work if you find this to be unsuccessful provided in the github repo is a second script called Clutter_db_all_files.sqlthis contains the auth tables necessary but it might cause conflicting issues. Should you need to use this repeat the steps for setting up the database with this script

●	Type > python manage.py runserver

●	Paste the localhost link into your browser of choice and you should be good to go

●	Should none of these solutions work we recommend following the Django setup tutorial and transferring the clutter & clutter db folder into the new environment
●	https://www.youtube.com/watch?v=kVrarEYMLWE&feature=youtu.be
 

