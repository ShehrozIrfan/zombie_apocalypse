class CreateSurvivals < ActiveRecord::Migration[5.2]
  def change
    create_table :survivals do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :gender
      t.boolean :isInfected
      t.integer :isInfectedCount

      t.timestamps
    end
  end
end
