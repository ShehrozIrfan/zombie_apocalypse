class AddMarkedInfectedToSurvival < ActiveRecord::Migration[5.2]
  def change
    add_column :survivals, :mark_infected, :boolean
  end
end
