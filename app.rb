require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/survey')
require('./lib/question')
require('pry')
require('pg')

get('/') do
  @surveys = Survey.all
  erb(:index)
end

get('/new_survey') do
  erb(:create_survey)
end

post('/new_survey') do
  name = params.fetch("name")
  Survey.create({:name => name})
  @surveys = Survey.all()
  erb(:index)
end

get('/surveys/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  erb(:questions)
end

post('/survey/:id/new') do
  name = params.fetch("name")
  survey_id = params.fetch("id").to_i
  Question.create({:name => name, :survey_id => survey_id})
  @survey = Survey.find(survey_id)
  erb(:questions)
end
