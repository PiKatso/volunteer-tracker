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

end

describe 'Project' do

  describe '#add' do
    it "adds a new project to the projects table in database" do
      expect(Project.add("habitat for humanity", 'repairing a home')[0]['id']).to match(UUID_MATCHER)
    end
  end
end
