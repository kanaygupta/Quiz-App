class State < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  belongs_to :question
end
