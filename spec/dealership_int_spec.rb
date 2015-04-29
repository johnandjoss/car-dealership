require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path for index', {:type => :feature}) do
  it('shows the link to list of dealerships and "add dealership" form') do
    visit('/')
    expect(page).to have_content('Welcome to')
  end
end
