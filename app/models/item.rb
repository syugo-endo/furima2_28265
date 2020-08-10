class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :category, :condition, :ship_from, :shipping_date, :shipping_fee
  validates :category, numericality: { other_than: 1 }
  validates :condition, numericality: { other_than: 1 }
  validates :shipping_fee, numericality: { other_than: 0 }
  validates :ship_from, numericality: { other_than: 1 }
  validates :shipping_date, numericality: { other_than: 1 }

  validates :category, :condition, :shipping_fee, :shipping_date, :ship_from, acceptance: true
  validates :text, :name, presence: true

  belongs_to :user
  has_one :buy
  has_one :deliver_address
end