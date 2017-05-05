require "volunteer_tracker"
require "rspec"
require "pry"
require 'pg'

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM volunteers *;")
    DB.exec("DELETE FROM projects *;")
    Project.add('Habitat for Humanity', 'repairing a home')
    Volunteer.add('Becky')
  end
end

UUID_MATCHER = /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/;
