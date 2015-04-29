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

end
