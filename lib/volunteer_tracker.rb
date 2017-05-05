require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'volunteer_tracker'})

class Volunteer

  def self.add(name)
    if Volunteer.find_by_name(name).any?
      id = Volunteer.find_by_name(name)[0]['id']
    else
    DB.exec("INSERT INTO volunteers VALUES (uuid_generate_v4(), '#{name.downcase}') RETURNING id;")
    end
  end

  def self.find_by_name(name)
    DB.exec("SELECT * FROM volunteers WHERE name = '#{name.downcase}';")
  end

  def self.find_by_id(id)
    DB.exec("SELECT * FROM volunteers WHERE id = '#{id}';")
  end

  def self.all
    DB.exec("SELECT * FROM volunteers;")
  end

  def self.delete(id)
    DB.exec("DELETE FROM volunteers WHERE id = '#{id}';")
  end

end

class Project

  def self.add(name, description)
    if Project.find_by_name(name).any?
      id = Project.find_by_name(name)[0]['id']
    else
      DB.exec("INSERT INTO projects VALUES (uuid_generate_v4(), '#{name.downcase}', '#{description.downcase}') RETURNING id;")
    end
  end

  def self.find_by_id(id)
    DB.exec("SELECT * FROM projects WHERE id = '#{id}';")
  end

  def self.find_by_name(name)
    DB.exec("SELECT * FROM projects WHERE name = '#{name}';")
  end

  def self.all
    DB.exec("SELECT * FROM projects;")
  end

  def self.delete(id)
    DB.exec("DELETE FROM projects WHERE id = '#{id}';")
  end

end

class Assignment
  def self.add(project_id, volunteer_id)
    # if Assignment.find_by_volunteer(volunteer_id).any?
    #   id = Assignment.find_by_volunteer(volunteer_id)[0]['id']
    # else
      DB.exec("INSERT INTO assignments VALUES (uuid_generate_v4(), '#{project_id}', '#{volunteer_id}') RETURNING id;")
    end
  end
end
