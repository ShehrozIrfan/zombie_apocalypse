class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :fiji_water
      t.integer :campbell_soup
      t.integer :first_aid_pouch
      t.integer :ak

      t.timestamps
    end
  end
end
