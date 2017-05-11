require "spec_helper"

describe 'Volunteer' do

  describe '#add' do
    it "adds a new volunteer to the volunteers table in database" do
      expect(Volunteer.add('Bruce')[0]['id']).to match(UUID_MATCHER)
    end
  end

  describe '#find_by_name' do
    it "finds the volunteer id by volunteer name" do
    expect(Volunteer.find_by_name('becky')[0]["id"]).to match(UUID_MATCHER)
    end
  end

  describe '#find_by_id' do
    it "finds the volunteer name by volunteer id" do
      id = Volunteer.find_by_name('becky')[0]["id"]
    expect(Volunteer.find_by_id(id)[0]["name"]).to eq('becky')
    end
  end

  describe '#all' do
    it "finds all volunteers in database" do
    expect(Volunteer.all()[0]["name"]).to eq('becky')
    end
  end

  describe '#delete' do
    it "deletes a volunteer" do
    id = Volunteer.find_by_name('Becky')[0]["id"]
    Volunteer.delete(id)
    expect(Volunteer.find_by_id(id).any?).to eq(false)
    end
  end

  describe '#assign_to_project' do
    it "assigns volunteer to project database" do
      id = Volunteer.find_by_name('becky')[0]["id"]
      project_id = Project.find_by_name('habitat for humanity')[0]["id"]
      Volunteer.assign_to_project(id, project_id)
    expect(Volunteer.all[0]['project_id']).to eq project_id
    end
  end

end

describe 'Project' do

  describe '#add' do
    it "adds a new project to the projects table in database" do
      expect(Project.add("Oregon food Bank", 'organizing food')[0]['id']).to match(UUID_MATCHER)
    end
  end

  describe '#find_by_name' do
    it "finds the project id by project name" do
    expect(Project.find_by_name('habitat for humanity')[0]["id"]).to match(UUID_MATCHER)
    end
  end

  describe '#find_by_id' do
    it "finds the project name by Project id" do
      id = Project.find_by_name('habitat for humanity')[0]["id"]
    expect(Project.find_by_id(id)[0]["name"]).to eq('habitat for humanity')
    end
  end

  describe '#all' do
    it "finds all projects in database" do
    expect(Project.all()[0]["name"]).to eq('habitat for humanity')
    end
  end

  describe '#delete' do
    it "delets project in database from id" do
      id = Project.find_by_name('habitat for humanity')[0]["id"]
    Project.delete(id)
    expect(Project.find_by_id(id).any?).to eq(false)
    end
  end

end
