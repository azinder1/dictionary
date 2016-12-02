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

get('/word/new') do
  erb(:word_form)
end

get('/words') do
  @words = Word.all()
  erb(:words)
end

post('/words/') do
  new_word = Word.new(:word_name => params.fetch('word'))
  new_word.save()
  @words = Word.all()

  erb(:words)
end


get('/word/:id') do
  @word = Word.find(param.fetch('id').to_i)
  @words = Word.all()
  erb(:words)
end
