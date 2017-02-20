class Item < ApplicationRecord
  has_and_belongs_to_many :buckets
  has_many :users, through: :buckets

  validates :name, presence: true, uniqueness: true
  validates :price, :days_cost, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
end
