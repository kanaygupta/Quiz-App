class Quiz < ApplicationRecord
  belongs_to :subcategory
  has_many :questions, dependent: :delete_all
  has_many :lequizs, dependent: :delete_all
end
