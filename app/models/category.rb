class Category < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }
  has_many :subcategories,dependent: :destroy
  has_many :lecategories,dependent: :destroy

end
