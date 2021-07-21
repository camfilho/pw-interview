class Answer < ApplicationRecord
  validates_presence_of :body

  belongs_to :question
  belongs_to :user
end
