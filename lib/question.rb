class Question < ActiveRecord::Base
  belongs_to(:surveys)
  validates(:name, :presence => true)
end
