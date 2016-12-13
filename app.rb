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

delete('/surveys/:id') do
  survey_id = params.fetch("id").to_i
  survey = Survey.find(survey_id)
  survey.destroy()
  @surveys = Survey.all
  erb(:index)
end

get('/survey/:id/edit') do
  survey_id = params.fetch("id").to_i
  @survey = Survey.find(survey_id)
  erb(:survey_update)
end

patch('/surveys/:id') do
  survey_id = params.fetch("id").to_i
  new_name = params.fetch("new_name")
  survey = Survey.find(survey_id)
  survey.update({:name => new_name})
  @surveys = Survey.all
  erb(:index)
end

get('/question/:id/edit') do
  question_id = params.fetch("id").to_i
  @question = Question.find(question_id)
  erb(:question_update)
end

patch('/questions/:id') do
  question_id = params.fetch("id").to_i
  new_name = params.fetch("new_name")
  survey_id = params.fetch("survey_id").to_i
  question = Question.find(question_id)
  question.update({:name => new_name})
  @survey = Survey.find(survey_id)
  @questions = Question.all
  erb(:questions)
end

delete('/questions/:id') do
  question_id = params.fetch("id").to_i
  question = Question.find(question_id)
  survey_id = question.survey_id()
  question.destroy()
  @survey = Survey.find(survey_id)
  erb(:questions)
end
