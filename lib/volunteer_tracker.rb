require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'volunteer_tracker'})

class Volunteer

  def self.add(name)
    DB.exec("INSERT INTO volunteers VALUES (uuid_generate_v4(), '#{name.downcase}') RETURNING id;")
  end

end

class Project

  def self.add(name, description)
    DB.exec("INSERT INTO projects VALUES (uuid_generate_v4(), '#{name.downcase}', '#{description.downcase}') RETURNING id;")
  end

end
