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
  it('creates a word objext with user inputted properties') do
    visit('/word/new')
    fill_in('word', :with => 'Bananza')
    click_button('Submit')
    expect(page).to have_content('Bananza')
  end
end
