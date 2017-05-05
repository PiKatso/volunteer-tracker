# Epicodus Volunteer Tracker

This application allows a user to track projects and the volunteers working on them. Each volunteer will belong to only one project, a one(project) to many(volunteers) relationship. The user will be able to view, add, update and delete both projects and volunteers.

### Installing

Installation is quick and easy! You can clone this repository to your machine, navigate to the file path in your terminal, and run 'app.rb' by typing '$ruby app.rb'. If you chose to clone the repository, after you run 'app.rb' you will need to copy the localhost path into your web browser. The standard localhost for Sinatra is port 4567

###Data Base Setup

Set up required project databases:

In PSQL:

CREATE DATABASE volunteer_tracker;
CREATE TABLE volunteers (id uuid PRIMARY KEY, name VARCHAR);
CREATE TABLE projects (id uuid PRIMARY KEY, name VARCHAR, description VARCHAR);
CREATE TABLE assignments (id uuid PRIMARY KEY, project_id uuid, volunteer_id uuid);

## Built With

* Ruby
* Browser: Chrome or Safari
* Sinatra
* HTML
* CSS
* Bootstrap https://getbootstrap.com/
* SQL
* PG

## Specifications

| behavior |  input   |  output  |
|----------|:--------:|:--------:|
| Web App accepts text | input: 'becky'  | output: 'becky'  |
| Web App accepts text, no symbols or numbers | input: 'becky!'  | output: "please enter a valid name"  |
| Web takes input to create/add new volunteers | input: 'becky'  | output: 'becky'  |
| Web checks input for duplicate before creating/adding new volunteers | input: 'becky'  | output: ''  |
| Web takes input to create/add new projects | input: 'habitat for humanity'  | output: 'habitat for humanity' |
| web app connects to databases to store info | input: volunteer 'Becky'  | output: volunteer_id, 'Becky' |
| web allows users to update volunteers | input: edit 'becky' | output: volunteer_id, 'barbra' |
| web allows users to update projects | input: edit 'habitat for humanity' | output: volunteer_id, 'oregon food bank' |
| web allows users to delete projects | input: delete 'habitat for humanity' | output: ''|
| web allows users to delete volunteers | input: delete 'becky' | output: '' |
| web allows volunteers to be assigned to projects | input: volunteer 'Becky' to 'habitat for humanity'  | output: volunteer_id, 'Becky' project_id 'habitat for humanity' |
<!-- |  |  |  | -->

## Authors

* Kat Gifford

## License

MIT

Copyright © 2017 Kat Gifford
