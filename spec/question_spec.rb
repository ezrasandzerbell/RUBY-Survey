require('spec_helper')

describe(Question) do
  it('tests for whether user input is valid') do
    question = Question.new({:name => ""})
    expect(question.save()).to(eq(false))
  end
  it('tests for whether each word in an instance of the Question class is titled, by way of the titleize_question method') do
    question = Question.create({:name => "bruce willis?"})
    expect(question.name).to(eq("Bruce Willis?"))
  end
end
