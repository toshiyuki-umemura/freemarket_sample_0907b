class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.string :prefecture,  null: false
      t.string :city,        null: false
      t.string :number,      null: false
      t.string :building,    null: false
      t.references :user, null: false, foreign_key:true
      t.timestamps
    end
  end
end
