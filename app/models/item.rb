class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :shipping_fee
  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :condition_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_fee_id, numericality: { other_than: 1, message: 'Select' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :shipping_date_id, numericality: { other_than: 1, message: 'Select' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end

  belongs_to :user
  has_one :buy
  has_one :deliver_address
  has_one_attached :image
end
