require('spec_helper')

describe(Question) do
  it('tests for whether user input is valid') do
    question = Question.new({:name => ""})
    expect(question.save()).to(eq(false))
  end
end
