require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a new survey', {:type => :feature}) do
  it('allows user to enter text for new survey') do
    visit('/')
    click_link('Create a new Survey')
    fill_in('name', :with => 'New Gallup Poll')
    click_button('Create Survey')
    expect(page).to have_content('NEW GALLUP POLL')
  end
end

describe('add questions to a new survey', {:type => :feature}) do
  it('navigates to new survey page') do
    visit('/')
    click_link('Create a new Survey')
    fill_in('name', :with => 'New Gallup Poll')
    click_button('Create Survey')
    click_link("NEW GALLUP POLL")
    expect(page).to have_content("NEW GALLUP POLL")
  end
  it('creates new question and displays on survey page') do
    visit('/')
    click_link('Create a new Survey')
    fill_in('name', :with => 'New Gallup Poll')
    click_button('Create Survey')
    click_link("NEW GALLUP POLL")
    expect(page).to have_content("NEW GALLUP POLL")
    fill_in('name', :with => "sup?")
    click_button('Create')
    expect(page).to have_content("sup?")
  end

end
