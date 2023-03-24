# Pokemon API


## Table of Contents

* [Q and A](#qanda)
* [Introduction](#introduction)
* [Install and start project](#install_project)
* [Prepopulate database](#fill_in_db)
* [Instructions](#instructions)
* [Links](#links)


<a name="qanda"></a>
## Q and A
From the provided technical test description several questions arises, but first lets imagine we are a team, working on different topics (projects)
* Ability to access the project topics requires user access - yes 
* Is any team member able to act on the the provided projects - yes 
* Could it be a team members having different roles, depending on the to have access restrictions  - yes 
* Do we need to store all Project state changes and project state prvious versions - yes

<a name="introduction"></a>
## Introduction
The project provides ability to  authenticated users to:
* change Project statuses depending on the user role
    <a name="project_statuses"></a> 
    - project statuses -> `To Do`, `In Progress`, `In Review`, `Tested`, `Done`
    - user roles -> `developer`, `qa`, `pm`
    <a name="user_abilities"></a> 
    - user abilities
        - `developer` is able to transition project's state to `In Progress` or `In Review`
        - `qa` is able to transition project's state to `In Progress`, `In Review`, or `Tested`
        - `pm` is able to transition project's state to `In Progress`, `In Review`, `Tested` or `Done`
* be able to write project comments (project conversations)
* be able to observe projects history - project's versions for each state change, including who done it


<a name="install_project"></a>
## Install and run project
* clone depository -> https://github.com/mlefterov86/homey.git
* run -> `bundle exec install`
* create DB -> `rails db:create`
* run database migrations -> `rails db:migrate`
* run data migrations -> [rails data:migrate](#run_data_migrations)
* run seeds -> [rails db:seed](#run_db_seeds)
* run Rails server on the desired port -> `rails s -p XXXX`


<a name="run_data_migrations"></a>
## Run data migrations
Data migrations a preparing DB with a constant predefined values. In our case it populates `roles` DB table with the provided roles

Available roles are: `developer`, `qa`, `pm`

<a name="run_db_seeds"></a>
## Run db seeds
DB Seeds a populating DB with some dummy predefined data for:
* users - creates users for each role we have
  * user_name: `developer@example.com`, password: `123456`
  * user_name: `qa@example.com`, password: `123456`
  * user_name: `pm@example.com`, password: `123456`
* seeds project records for each of the available [project statuses](#project_statuses), corresponding [Seed file](https://github.com/mlefterov86/homey/blob/develop/db/seeds/projects.rb)
    
    Examples: 
  * Project in `To Do` state
    ```
    Project.name == 'To do Project'
    Project.summary == 'some random text'
    Project.state == 10
    ```
  * Project in `In Progress` state
    ```
    Project.name == 'In progress Project'
    Project.summary == 'some random text'
    Project.state == 20
    ```
  * etc ..
      ##### Note: Project state mappings could be find [here](https://github.com/mlefterov86/homey/blob/develop/app/models/project.rb#L9).

* seeds 5 comments for each of the projects with random text

<a name="instructions"></a>
## Instructions
* After running the rails server please login with one of the provided users
* You will be able to get a list of projects
* next to each project you can find the available actions, depending on the user role ([user abilities reference](#user_abilities))
* clicking on one of the projects will land you to the `Project#show` page, where you will find:
  * project title
  * a link to observe the available project versions (project version is generated once the user change project state)
  * project summary
  * a text area to write a comment
  * all listed available project's comments

<a name="links"></a>
## Links
You can also fine additional links to exercises I did in the past:
* https://github.com/mlefterov86/pokemon_api
* https://github.com/mlefterov86/recepti
