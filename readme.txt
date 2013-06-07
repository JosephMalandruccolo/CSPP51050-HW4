Note to grader:
Run main.rb for output

Homework 4 Due Friday, June 14th 11:59 PM

Submitting:

Submit your assignments in a folder called HW4 to the subversion repository according to the directions on the syllabus page. Place all of your Homework 4 work into one folder. You will only be graded on your material within a reasonably labeled folder. 
Also, include a README text file that contains the programming language you used. If you want to give the TAs/graders instructions on how to compile, run, or even understand your code, you can place that within the README as well.

Each assignment (HW or Lab Deliverable) should have its own folder with its own README inside of it. Please ask for assistance if you have any questions

Problem (Model-View-Controller):

You will implement a traffic light system using the MVC architecture. The output of the program will look something like this:

Status: 
Traffic Light 1: 
Red: ON, Yellow: OFF, Green: OFF

Pedestrian Light: Walk OFF, Don't Walk: ON
  
Press any key to change light......<enter>

Status: 
Traffic Light 1: 
Red: OFF, Yellow: OFF, Green: ON

Pedestrian Light: Walk ON, Don't Walk: OFF
 
Press any key to change light......<enter>

Status: 
Traffic Light 1: 
Red: OFF, Yellow: ON, Green: OFF

Pedestrian Light: Walk OFF, Don't Walk: Flashing
  
 
Press any key to change light......<enter>

etc.

What you need to implement

A base class called Observer which has an update method (ref. page 129 Buschman). Classes View and Controller are subclasses of Observer. Controller takes all input from the user. Views 1 & 2 displays the current status of the lights, whenever the status is updated. 2 Models (TrafficLight & PedestrianLight)  contains the core functionality and actual status of lights.

Below is a sample interaction between the classes.

Controller gets user input and informs Model. Models changes the traffic light and updates Views and Controller. View sdisplays the new status of the lights and Controller awaits next user input.