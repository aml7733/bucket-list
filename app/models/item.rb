class Item < ApplicationRecord
  has_and_belongs_to_many :buckets
  has_many :users, through: :buckets
  validates :name, presence: true
  validates :price, :days_cost, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  after_initialize :default_price_and_days

  def default_price_and_days
    self.price ||= 0.0
    self.days_cost ||= 0
  end

end
