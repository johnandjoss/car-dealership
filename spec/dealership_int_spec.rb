require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path for index', {:type => :feature}) do
  it('shows the link to list of dealerships and "add dealership" form') do
    visit('/')
    expect(page).to have_content('Welcome to')
  end

  describe('path for all dealerships', {:type => :feature}) do
    it('shows the list of all dealerships ') do
      visit('/all_dealers')
      expect(page).to have_content('Dealerships')
    end
  end

  describe('path for all dealers/new', {:type => :feature}) do
    it('allows user to input a new dealership ') do
      visit('/all_dealers/new')
      fill_in('name', :with => 'Ford')
      click_button('Add Dealership')
      expect(page).to have_content('Success')
    end
  end

  describe('path for all adding and showing all dealerships', {:type => :feature}) do
    it('shows the list of all available ') do
      visit('/all_dealers/new')
      fill_in('name', :with => 'Manny')
      click_button('Add Dealership')
      expect(page).to have_content('Success')
      click_link('See Dealership List')
      expect(page).to have_content('Dealerships')
      click_link("Manny")
      expect(page).to have_content('Here are')
    end
  end

  describe('path for all adding a vehicle to a dealership', {:type => :feature}) do
    it('shows the list of all available ') do
      visit('/all_dealers/new')
      fill_in('name', :with => 'Killian')
      click_button('Add Dealership')
      expect(page).to have_content('Success')
      click_link('See Dealership List')
      expect(page).to have_content('Dealerships')
      click_link("Killian")
      expect(page).to have_content('Here are')
      click_link("Add a new vehicle")
      fill_in('make', :with => 'Honda')
      fill_in('model', :with => 'Accord')
      fill_in('year', :with => '1998')
      click_button('Add Vehicle')
      expect(page).to have_content('Success')
    end
  end
  
end
