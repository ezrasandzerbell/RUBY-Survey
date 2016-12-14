class Question < ActiveRecord::Base
  belongs_to(:surveys)
  before_save(:titleize_question)
  validates(:name, :presence => true)

private
  define_method(:titleize_question) do
    self.name=(name().titleize())
  end
end
