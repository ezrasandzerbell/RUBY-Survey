ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('rspec')
require('pry')
require('pg')
require('question')
require('survey')

RSpec.configure do |config|
  config.after(:each) do
    Survey.all().each() do |survey|
      survey.destroy()
    end
    Question.all().each() do |question|
      question.destroy()
    end
  end
end
