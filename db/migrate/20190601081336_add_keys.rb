class AddKeys < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :challenge_id, :integer
    add_column :confirmations, :challenge_id, :integer
  end
end
