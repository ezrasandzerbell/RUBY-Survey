class Survey < ActiveRecord::Base
  has_many(:questions)
  before_save(:capitalize_name)
  validates(:name, :presence => true, :uniqueness => {:case_sensitive => false})

private
  define_method(:capitalize_name) do
    self.name=(name().upcase())
    end
end
