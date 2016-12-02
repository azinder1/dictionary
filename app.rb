require('sinatra/reloader')
require('pry-nav')
require('sinatra')
require('./lib/definition')
require('./lib/word')
require('./app')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/word/new') do
  @words = Word.all()
  erb(:word_form)
end

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/') do
  new_word = Word.new(:word_name => params.fetch('word'))
  new_word.save()
  @words = Word.all()

  erb(:index)
end

get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i)
  @words = Word.all()
  erb(:word)
end
