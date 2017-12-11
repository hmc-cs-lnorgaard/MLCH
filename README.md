# Shakespeare Script Editor
## Contents
1. [Summary](#summary) 
   * [Problem description](#problem-description)
   * [Stakeholders](#stakeholders)
2. [Architecture](#architecture)
   * [Prerequisites](#prerequisites)
   * [Gems](#gems)
   * [Minimum Viable Product](#minimum-viable-product)
   * [Architecture Model](#architecture-model)
3. [Installation](#installation)
4. [Functionality](#functionality)
   * [Use Cases](#use-case)
5. [Known Problems](#known-problems)
6. [Contributing](#contributing)

## Summary 
The Shakespeare Script Editor is a website made by team Pawgrammers for CS121: Software Development in the Fall 2017 semester progressing upon work done by team MLCH completed in the Spring 2017 semester. Our web app provides a simple and easy way for directors and actors to
edit scripts and read plays. On the website, a user can choose between any of Shakespeare’s plays. Chosen plays are not only readable, but editable! Users can cut down the play word-by-word. After editing the play to their specifications, the website will provide relevant data and statistics too, such as the number of lines in the play and the number of lines for each individual character in a particular play.

### Problem description
Often when planning a play or preparing for a performance, directors and
actors alike tend to cut out sections from the original script to make it shorter
or get rid of unnecessary lines. Currently two methods exist for this task,
and both have limitations. Directors and actors can either cross out sections
by hand and ignore them, which is tedious and makes the plays harder to
read and interact with, or they can use a generic text editor like Google Docs,
but this provides so much freedom that the original content of the script
can be easily manipulated or lost (as in the case where someone adds lines
that didn’t previously exist to the script). A dedicated script viewer and
editor that primarily only allows cutting and restoring lines would address
both of these issues. It would allow for easier cutting and viewing without
allowing the play to be lost in edits, while also being able to provide data
analysis, like the number of lines per play and which characters are in it, on
the works themselves.

### Stakeholders
Stakeholders for this project include:
* Professors BenWiedermann and Ambereen Dadabhoy – Clients whose
desire for this project is to provide an easier platform to edit Shakespeare
plays. Currently our clients use generic text editors and they
are frustrated by their limited functionality that create difficulty in
editing plays.
* Student collaborators – Users who eventually will be able to suggest
edits to plays along with viewing them.
* Student performers – Users who have read only access to plays
* Directors – Users who are able to edit plays as well as accept or decline
edits suggested by student collaborators. While these are similar to
the clients, our clients explicitly expressed a desire for this application
to be flexible for use outside of their class for generic directors.



## Architecture

### Prerequisites
You must have Ruby on Rails and git on your machine, and clone the repository onto your computer from https://github.com/hmc-cs-lnorgaard/MLCH.git


### Gems 
1.Nokogiri - this gem is used to parse XML files into HTML files.
### Minimum Viable Product
Our MVP will be built off of one of the codebases provided from previous
semesters. We will use their webpage layout and the parser they worked
on to put the plays on the site. Forking one of these provided codebases
should give us a large portion of the functionality desired in our MVP,
namely choosing a play from those available, reading said play, navigating
through the play’s acts, and searching text within the chosen play using the
browser’s search functionality. On top of these pre-provided functions our
MVP should include the ability to cut out words of the play by highlighting
them, and then saving these edits.

### Architecture Model

#### High Level Design 
Our architecture at large has three categories: preprocessing steps, serverside
architecture, and client-side UI. Figure 1 below presents a component
diagram that outlines these three categories. Preprocessing involves downloading
XML files of Shakespeare plays from Folger’s Online Library, which
will then be parsed to HTML files by the Nokogiri gem. These original play
HTML files will be stored on the server. The user starts on the play index,
and upon choosing a play, the original play HTML file will be displayed,
formatted by scss. The user will then be able to cut text from the play, which
will be handled by JavaScript functions. When finished JavaScript will be
used to save the edited version of the play, which will be loaded from thenon.
The user can also view analytics calculated by other JavaScript functions.
The decisions and reasoning for using this architecture is presented later in
this document.

# TODO - Place component diagram here

The previous group’s work had scaffolding set up for a user role, a
constant play role that models the original, unedited work as gathered
from the Folger’s database, and an edited play role that holds the cuts and
changes performed by a user; however, the user role was left incomplete
and the play and edited play roles were never actually separated. We intend
to finish these roles so that they fit the UML class diagram in Figure 2.

#### Software Design Pattern
We will use the Model-View-Controller software design pattern as it is
heavily supported by the Ruby on Rails framework and has proven to work
well with the web applications we have developed previously.


## Installation
TODO 
Prerequisites: install Ruby/Rails and git on your machine

1. Clone the repo: git clone https://github.com/hmc-cs-lnorgaard/MLCH.git
2. cd into the script_editor folder
3. Install gems: Nokogiri, bootstrap, use the command bundle install in terminal to install gems
4. use 'rails s' to run the app, then open a browser and go to 'localhost:3000'


## Functionality
TODO -- Copy the final report's functionality section here

This section outlines our plans to to implement other functionality on top
of our MVP. 
1. Viewing: The user will be able to see any Shakespeare play in readable,
aesthetically-pleasing format. This has already been implemented.
2. Navigation: The user will be able to navigate to any place in the script
thanks to a navigation bar on one side of the screen. This has already
been implemented.
# Insert gif for navigating play here
3. Strikethrough: The user can cut through words and lines that they
would like to remove from the play using highlighting.
# Insert gif for cutting play here 
4. Saving: The site will either auto-save or allow the user to manually
save edited versions of each play
5. Printing: The user will be able to print their full, edited version of the
play
6. Analytics: The site will calculate and display information about each
play, such as the number of lines and characters
# Insert screenshot of analytics here 
7. Full and Concise Versions: The user should have the option of viewing
either the full original version of the play, having cuts distinct but
visible, and the concise version where cuts are removed to see context
when necessary
# insert screenshot of toggle button here 

### Use Case 
TODO 
Figure 3 below outlines the use case of each page of the site.

# Place use case diagram here

## Known Problems 

## References 
George Mason University. 2017. Open Source Shakespeare - Search Shakespeare’s
Works, Read the Texts. https://www.opensourceshakespeare.org.
Instructure. 2017. Canvas LMS. https://github.com/instructure/canvas-lms.
MLCH. 2017. Shakespeare Script Editor. Print.
Team 1. 2017. Shakespeare Script Editor. Print.


## History

12/10/2017: Version 2.0.0
    Implemented Features:
        Highlight cutting 
        Toggle View
        Saving 
        Printing 
        Analytics 

5/4/2017: Version 1.0.0
  
  Implemented Features:
    Homepage
    Search Bar
    Formatted Play Display
    Editing interface
    Internal Play Navigation
    Synopsis
    
## Credits

Contributors: Jackson Crewe, Chloe Elliott, Blake Larkin, Montana Roberts, Mahlet Melaku, Holly Mitchell, Lee Norgaard, Crystal Xiang

Client: Prof. Benjamin Wiedermann, Prof Ambereen Dadabhoy

CS121 Professor: Yekaterina Kharitonova

## License

See LICENSE.txt
