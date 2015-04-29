require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path for index to return a vehicle list', {:type => :feature}) do
  it('shows the list of cars and shows link to "add car" form') do
    visit('/')
    expect(page).to have_content('Welcome to Vehicle saver')
  end
end
