class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :category, :condition, :ship_from, :shipping_date, :shipping_fee
  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category, numericality: { other_than: 1, message: 'Select' }
    validates :condition, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_fee, numericality: { other_than: 1, message: 'Select' }
    validates :ship_from, numericality: { other_than: 0, message: 'Select' }
    validates :shipping_date, numericality: { other_than: 1, message: 'Select' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end

  belongs_to :user
  has_one :buy
  has_one :deliver_address
  has_one_attached :image
end
