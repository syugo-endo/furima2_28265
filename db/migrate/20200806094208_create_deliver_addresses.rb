class CreateDeliverAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :deliver_addresses do |t|
      t.string :zip_code,    default: "",  null: false
      t.integer :prefecture,                  null: false
      t.string :city,           default: "",  null: false
      t.string :address1,    default: "",   null: false
      t.string :address2,    default: ""
      t.string :telephone,   null: false
      t.references :item,                null: false,  foreign_key: true
      t.timestamps
    end
  end
end
