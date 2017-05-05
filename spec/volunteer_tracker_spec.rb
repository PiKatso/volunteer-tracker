require "spec_helper"

describe 'Volunteer' do

  describe '#add' do
    it "adds a new volunteer to the volunteers table in database" do
      expect(Volunteer.add('becky')[0]['id']).to match(UUID_MATCHER)
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

end

describe 'Project' do

  describe '#add' do
    it "adds a new project to the projects table in database" do
      expect(Project.add("habitat for humanity", 'repairing a home')[0]['id']).to match(UUID_MATCHER)
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

end
