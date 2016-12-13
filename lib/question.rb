class Question < ActiveRecord::Base
  belongs_to(:surveys)
  before_save(:downcase_name)

private

  define_method(:downcase_name) do
    self.name=(name().downcase())
  end
end
