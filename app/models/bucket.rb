class Bucket < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :items
  accepts_nested_attributes_for :items

  validate :name, presence: true, uniqueness: true
  validates :user_id, presence: true
  validates_associated :items

  def items_attributes=(item_attributes)
    item_attributes.values.each do |item_attribute|
      item = Item.find_or_create_by(item_attribute)
      self.items << item
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
      days += item.time_cost
    end
    count
  end
end
