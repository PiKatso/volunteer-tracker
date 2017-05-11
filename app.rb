require 'sinatra'
require 'sinatra/reloader'
require './lib/volunteer_tracker'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

# project routing
post('/add-project') do
  project_name = params['project-name'].downcase
  project_description = params['project-description'].downcase
  Project.add(project_name, project_description)
  erb(:index)
end

get('/projects') do
  erb(:projects_all)
end

post('/projects') do
  erb(:projects_all)
end

get('/project/:id') do
  id = params['id']
  @project = Project.find_by_id(id)
  erb(:project)
end

patch '/project/:id/update-description' do
  id = params['id']
  new_project_desc = params.fetch("update-project-desc")
  @project = Project.update_description(id, new_project_desc)
  redirect '/projects'
end

patch '/project/:id/update-title' do
  id = params['id']
  new_project_title = params.fetch("update-project-title")
  @project = Project.update_name(id, new_project_title)
  redirect '/projects'
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

# beg volunteer routing
post('/add-volunteer') do
  first_name = params['first-name']
  last_name = params['last-name']
  volunteer_name = (first_name + ' ' + last_name).downcase
  Volunteer.add(volunteer_name)
  erb(:index)
end

get('/volunteers') do
  erb(:volunteers_all)
end

post('/volunteers') do
  erb(:volunteers_all)
end

get('/volunteer/:id') do
  @volunteer = Volunteer.find_by_id(params['id'])
  if @volunteer[0]['project_id'] != nil
    @project = Project.find_by_id(@volunteer[0]['project_id'])
  end
  erb(:volunteer)
end


post '/volunteer/assign' do
  data = params.fetch('volunteer')
  project_id = data['project_id']
  volunteer_id = params.fetch('volunteer_id')
  Volunteer.assign_volunteer(volunteer_id, project_id)
  redirect "/volunteer/#{volunteer_id}"
end

patch '/volunteer/:id/update' do
  id = params['id']
  volunteer_name = params.fetch("update-volunteer")
  @volunteer = Volunteer.update_name(id, volunteer_name)
  redirect '/volunteers'
end

get('/volunteer/delete/:id') do
  id = params['id']
  @volunteer = volunteer.find_by_id(id)
  erb(:projects_all)
end

delete('/volunteer/delete/:id') do
  id = params['id']
  Volunteer.delete(id)
  erb(:projects_all)
end
