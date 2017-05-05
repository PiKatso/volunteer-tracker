require 'sinatra'
require 'sinatra/reloader'
require './lib/volunteer_tracker'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

post('/add-project') do
  project_name = params['project-name']
  project_description = params['project-description']
  #need to clean string/check valid input still
  Project.add(project_name, project_description)
  erb(:index)
end

post('/projects') do
  erb(:projects_all)
end

get('/project/:id') do
  id = params['id']
  @project = Project.find_by_id(id)
  erb(:project)
end

get('/project/delete/:id') do
  id = params['id']
  @project = Project.find_by_id(id)
  erb(:projects_all)
end

delete('/project/delete/:id') do
  id = params['id']
  Project.delete(id)
  erb(:projects_all)
end

post('/add-volunteer') do
  first_name = params['first-name']
  last_name = params['last-name']
  volunteer_name = first_name + ' ' + last_name
  Volunteer.add(volunteer_name)
  erb(:index)
end

post('/volunteers') do
  erb(:volunteers_all)
end

# get('/volunteers/:id') do
#   id = params['id']
#   # @volunteers = Volunteer.find_by_id(id)
#   erb(:volunteer)
# end
