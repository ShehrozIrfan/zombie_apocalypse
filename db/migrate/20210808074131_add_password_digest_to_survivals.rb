class AddPasswordDigestToSurvivals < ActiveRecord::Migration[5.2]
  def change
    add_column :survivals, :password_digest, :string
  end
end
