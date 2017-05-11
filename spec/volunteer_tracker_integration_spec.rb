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

  # it("will click a project button at top and go to page that holds all projects") do
  #   visit("/")
  #   fill_in("project-name", :with => "Beach clean up")
  #   fill_in("project-description", :with => "Do stuff")
  #   click_button("Create Project")
  #   visit('/projects')
  #   click_link("Beach clean up")
  #   expect(page).to have_content("All Projects: Beach clean up Do stuff")
  #   click_button("Home")
  # end

end

describe("the volunteer path", {:type => :feature}) do

  it("creates a volunteer and displays project info on the project page") do
    visit("/")
    fill_in("first-name", :with => "Ben")
    fill_in("last-name", :with => "Stiller")
    click_button("Add Volunteer")
    expect(page).to have_content()
  end

  # it("will click a project button at top and go to page that holds all projects") do
  #   visit("/")
  #   fill_in("first-name", :with => "Ben")
  #   fill_in("last-name", :with => "Stiller")
  #   click_button("Add Volunteer")
  #   visit('/volunteers')
  #   click_link("Ben Stiller")
  #   expect(page).to have_content("Ben Stiller")
  # end

end
