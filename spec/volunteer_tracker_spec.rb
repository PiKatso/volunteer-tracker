require "spec_helper"

describe 'Volunteer' do

  describe '#add' do
    it "adds a new volunteer to the volunteers database" do
      expect(Volunteer.add('becky')[0]['id']).to match(UUID_MATCHER)
    end
  end

end
