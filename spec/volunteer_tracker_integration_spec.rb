require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the project path", {:type => :feature}) do
  it("creates a project and displays project info on the project page") do
    visit("/")
    fill_in("project-name", :with => "volunteer")
    fill_in("project-description", :with => "Do stuff")
    click_button("Create Project")
    expect(page).to have_content()
  end
end
