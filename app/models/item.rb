class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  validates :category, numericality: { other_than: 1 }
  belongs_to_active_hash :condition
  validates :condition, numericality: { other_than: 1 }

  belongs_to :user
  has_one :buy
  has_one :deliver_address
end