class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one :deliver_address
end