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

post('/add-volunteer') do
  first_name = params['first-name']
  last_name = params['last-name']
  volunteer_name = first_name + ' ' + last_name
  Volunteer.add(volunteer_name)
  erb(:index)
end
