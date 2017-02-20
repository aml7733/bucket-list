require 'pry'

class Bucket < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :items
  accepts_nested_attributes_for :items

  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true

  def items_attributes=(items_attributes)
    items_attributes.values.each do |item_attributes|
      item = Item.find_or_create_by(item_attributes)
      self.items << item
      item.save
    end
  end

  def most_expensive_item
    self.items.order(price: :desc).limit(1)
  end

  def total_cost
    price_prime = 0
    days = 0
    items.each do |item|
      price_prime += item.price
      days += item.days_cost
    end
    "$#{price_prime} and #{days} days needed to kick this bucket."
  end
end
