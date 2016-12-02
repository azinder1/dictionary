require('capybara/rspec')
require('word')
require('definition')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  it('creates a word object with user inputter properties') do
    visit('/')
    expect(page).to have_content("Add a new word")
  end
  it('can follow word form path where user can input word') do
    visit('/')
    click_link('Add a new word')
    expect(page).to have_content("Word:")
  end
  it('creates a word object with user inputted properties') do
    visit('/word/new')
    fill_in('word', :with => 'Bananza')
    click_button('Submit')
    expect(page).to have_content('Bananza')
  end
  it('can follow the word link with a unique id') do
    visit('/')
    click_link('Bananza')
    expect(page).to have_content('Add Definition')
  end
  it('can add a definition for a unique word') do
    visit('/word/1')
    click_link('Add Definition')
    expect(page).to have_content('Definition:')
  end
  it('can display inputted definition for each entry') do
    visit('/word/1/definition/new')
    fill_in('definition', :with => "A fun gathering")
    select('Noun', :from => 'type')
    click_button('Submit')
    expect(page).to have_content("A fun gathering")
  end
  it('will not display definitions for other words') do
    visit('/')
    click_link('Add a new word')
    fill_in('word', :with => 'Party')
    click_button('Submit')
    click_link('Party')
    expect(page).to have_no_content("A fun gathering")
  end
  it('can display inputted definitions for multiple entries') do
    visit('/word/1/definition/new')
    fill_in('definition', :with => "Party! Party! Party!")
    select('Noun', :from => 'type')
    click_button('Submit')
    expect(page).to have_content("Party! Party! Party!")
  end
end
