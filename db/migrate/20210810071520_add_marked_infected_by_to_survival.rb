class AddMarkedInfectedByToSurvival < ActiveRecord::Migration[5.2]
  def change
    add_column :survivals, :marked_infected_by, :integer
  end
end
