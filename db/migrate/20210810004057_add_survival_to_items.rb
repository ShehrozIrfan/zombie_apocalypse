class AddSurvivalToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :survival, foreign_key: true
  end
end
