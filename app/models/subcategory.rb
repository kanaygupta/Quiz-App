class Subcategory < ApplicationRecord
  belongs_to :category
  validates :category_id, presence: true
  validates :name,  presence: true, length: { maximum: 50 }
  has_many :quizzes,dependent: :destroy
  has_many :lesubcategories,dependent: :destroy
end
