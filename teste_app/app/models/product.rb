class Product < ApplicationRecord
  belongs_to :category

  validates :description, :category, :price, presence: true

  def full_description
    "#{self.description} - #{self.price}"
  end
end
