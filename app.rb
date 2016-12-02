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
  @definitions = Definition.all()
  erb(:word)
end

get('/word/:id/definition/new') do
  @word = Word.find(params.fetch('id').to_i)
  erb(:definition_form)
end

post('/word/:id/definition/new') do
  @word = Word.find(params.fetch('id').to_i)
  @words = Word.all()
  new_definition = Definition.new(:definition_sentence => params.fetch('definition'))
  new_definition.save()
  @word.add_word_definition(new_definition)
  @definition = Definition.all()
  erb(:word)
end
