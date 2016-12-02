require('sinatra/reloader')
require('pry-nav')
require('sinatra')
require('./lib/definition')
require('./lib/word')
require('./app')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

post('/word') do
  new_word = Word.new(:word => params.fetch('word'))
  new_word.save()
  @words = Word.all()
  erb(:index)
end

get('/word/new') do
  erb(:word_form)
end
