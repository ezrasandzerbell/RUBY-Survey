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
    expect(page).to have_content("Sup?")
  end
end

describe('delete survey from index page', {:type => :feature}) do
  it('creates and deletes survey on/from index') do
    visit('/')
    click_link('Create a new Survey')
    fill_in('name', :with => 'New Gallup Poll')
    click_button('Create Survey')
    click_button('Delete Survey')
    expect(page).to have_content('Design Surveys')
  end
end

describe('edit survey from index page', {:type => :feature}) do
  it('creates survey and navigates to edit page') do
    visit('/')
    click_link('Create a new Survey')
    fill_in('name', :with => 'New Gallup Poll')
    click_button('Create Survey')
    expect(page).to have_content("NEW GALLUP POLL")
    click_link('Update Name')
    expect(page).to have_content('Change the name')
  end
end

describe('delete question from questions page', {:type => :feature}) do
  it('creates and deletes survey question on/from survey index') do
    visit('/')
    click_link('Create a new Survey')
    fill_in('name', :with => 'Sky Color')
    click_button('Create Survey')
    click_link('SKY COLOR')
    fill_in('name', :with => 'Is the sky blue?')
    click_button('Create')
    click_button('Delete Question')
    expect(page).to have_content('SKY COLOR')
  end
end

describe('edit question from questions page', {:type => :feature}) do
  it('creates survey question and navigates to edit page') do
    visit('/')
    click_link('Create a new Survey')
    fill_in('name', :with => 'Sky Color')
    click_button('Create Survey')
    click_link('SKY COLOR')
    fill_in('name', :with => 'Is the sky blue?')
    click_button('Create')
    click_link('Update Question')
    fill_in('new_name', :with => 'Is the sky gray?')
    click_button('Change Question')
    expect(page).to have_content('Is The Sky Gray?')
  end
end
