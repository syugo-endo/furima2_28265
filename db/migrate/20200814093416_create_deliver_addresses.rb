class CreateDeliverAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :deliver_addresses do |t|
      t.references :item,     null: false, foreign_key: true
      t.string :zip_code,     null: false
      t.string :prefecture_id,   null: false
      t.string :city,         null: false
      t.string :address1,     null: false
      t.string :address2,     null: false
      t.string :telephone,    null: false, unique: true
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
