class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,       null: false,   foreign_key: true
      t.string :category,       null: false
      t.string :condition,      null: false
      t.string :price,          null: false
      t.string :name,           null: false
      t.text :text,             null: false
      t.integer :shipping_date
      t.integer :shipping_fee,  null: false
      t.integer :ship_from,     null: false
      t.timestamps
    end
  end
end
