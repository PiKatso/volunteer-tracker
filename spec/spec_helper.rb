require "volunteer_tracker"
require "rspec"
require "pry"
require 'pg'

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM volunteers *;")
    DB.exec("DELETE FROM projects *;")
    # DB.exec("DELETE FROM assignments *;")
    Project.add('Habitat for Humanity', 'repairing a home')
    Volunteer.add('Becky')
    project_id =Project.find_by_name('habitat for humanity')[0]["id"]
    volunteer_id =Volunteer.find_by_name('becky')[0]["id"]
    # Assignment.create(project_id, volunteer_id)
  end
end

UUID_MATCHER = /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/;
