# Shakespeare Script Editor
## Contents
1. [Summary](#summary) 
   * [Problem description](#problem-description)
   * [Stakeholders](#stakeholders)
2. [Architecture](#architecture)
   * Prerequisites(#prerequisites)
   * Gems(#gems)
   * [Minimum Viable Product](#minimum-viable-product)
   * [Architecture Model](#architecture-model)
3. [Installation](#installation)
4. [Functionality](#functionality)
   * [Use Cases](#use-case)
5. [Known Problems](#known-problems)
6. [Contributing](#contributing)
7. [Project Timeline](#timeline)
## Summary 
The Shakespeare Script Editor is a website made by team Pawgrammers for CS121: Software Development in the Fall 2017 semester progressing upon work done by team MLCH completed in the Spring 2017 semester. Our web app provides a simple and easy way for directors and actors to
edit scripts and read plays. On the website, a user can choose between any of Shakespeare’s plays. Chosen plays are not only readable, but editable! Users can cut down the play word-by-word. After editing the play to their specifications, the website will provide relevant data and statistics too, such as the number of lines in the play and the number of lines for each individual character in a particular play.

## Installation

Prerequisites: install Ruby/Rails and git on your machine

1. Clone the repo: `git clone https://github.com/hmc-cs-lnorgaard/MLCH.git`
2. cd into the script_editor folder
2. Install gems: Nokogiri, bootstrap,
    use the command `bundle install` in terminal to install gems
3. Run the app: use the command `rails s` in terminal, then navigate to
    localhost:3000 in your prefered browser

## Usage

To run the website on localhost:

in terminal:

`cd MLCH`

`cd script_editor`

`rails s`

in browser:

localhost:3000


## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## Problem description
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

## Stakeholders
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

## Background research 

This section outlines what resources we plan to base our design and coding
decisions on. We expect that this list is incomplete, and will do further
research as the need for it arises.

1. Open Source Shakespeare (George Mason University 2003), is a website
that the client often uses to access Shakespeare plays. She indicated
that she wanted a similar layout for this project, so we will be
basing many of our stylistic choices on this website.
2. The Shakespeare Scripting site developed by MLCH (MLCH 2017),
one of a Spring 2017 section’s 121 teams, is what we plan to build our
code on top of. The site already has the functionality of displaying
all of the plays on a homescreen, and allowing the user to view and
navigate any of the works.
3.  Canvas Instructure’s source code (Instructure 2017) uses Ruby on Rails
and has strikethrough functionality. Because adding strikethrough
functionality is one of our major goals, we plan to adapt Canvas’
implementation of it to the MLCH site.

## Proposed solution
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

# Place figure 1 from Phase 3 report here 

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

### Use Case 
Figure 3 below outlines the use case of each page of the site.

# Place figure 2 from phase 3 report here
# Place figure 3 from phase 3 report here 

#### Wireframes 
Figure 4 below presents basic wireframes outlining how the user will interact
with the different pages of the site.

# Place figure 4 from phase 3 reports here 

### Functionality
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

## Risks and solutions 
Do we want to include this section? 

## Timeline 
Phase 1:
* Setup
19
    * Explore Canvas source code to understand how strikethrough
works
    * Familiarize ourselves with MLCH’s project and code
* Implement strikethrough
    * Create an edit mode in which you can highlight text and click a
“cut” button to strike through
    * Create a view for both the original text and edited version
    * Store struck-through text in a local file
* Concise and Full Views for Plays
    * Create a toggle that shows and hides edited text
* Deliverable: A working site where users can access and make cuts
to any Shakespeare play. They will be able to see both their edited
version and the original.
Phase 2:
* Make analytics functional
    * Determine which are most important (number of lines, characters,
etc.) to the user
    * Calculate those and store in either a database or local file
    * Create a display and access button for the user to see them
* Concise and Full Views for Plays
    * Allow the user to switch between displaying cuts and hiding all
cuts
    * Editing should only be allowed in the full view
    * Formatting should be such that makes reading easy for the user
* Deliverable: An attractive, intuitive website where users can see and
make cuts to Shakespeare plays, as well as access other relevant and
interesting information about each play, and save the edits they make
to different plays.
Phase 3:
* Saving
20 Timeline
    * Save the edited plays locally for each user
        ∗ Eventually this may be redone for multiple users, but for
the MVP, each local version of the application will have one
edited version of each play
* Clean up UI
    * Implement a blue-based color scheme rather than black and
white
    * Make navigation bar easier to user and cleaner-looking (contained
on one page rather than scrolling)
* Integration
    * Up to this point, we’ve all been working on different branches
of our repository for various features. We will need to integrate
these in the final coding phase so that they all work together in
the finished product.
* Printing
    * Allow the user to print out the full and edited version of each
play
* Deliverable: A website where users can view and make edits of
Shakespeare plays, and then save and print those edited plays, or the
unedited versions. Users can also view and print out cue scripts of all
the characters in each play.
Phase 4:
* Refactoring
    * Get rid of superfluous and unused code from previous group
    * Cut down on as many code smells as we can find
    * Create and use Ruby controllers so that all the work isn’t being
done in the view part of View-Model-Controller system
* Project Presentation
* Project Poster
* Deliverable: Project Poster and final website with all the MVP functionality

## References 
George Mason University. 2017. Open Source Shakespeare - Search Shakespeare’s
Works, Read the Texts. https://www.opensourceshakespeare.org.
Instructure. 2017. Canvas LMS. https://github.com/instructure/canvas-lms.
MLCH. 2017. Shakespeare Script Editor. Print.
Team 1. 2017. Shakespeare Script Editor. Print.


## History

11/21/2017: Version 2.0.0
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

Contributors: Mahlet Melaku, Holly Mitchell, Lee Norgaard, Crystal Xiang

Client: Prof. Benjamin Wiedermann

CS121 Professor: Yekaterina Kharitonova

## License

See LICENSE.txt
