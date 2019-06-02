class FixIdColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :tests, :challenge_id, :integer
    remove_column :confirmations, :challenge_id, :integer
    add_column :tests, :challenge_id, :integer, null: false
    add_column :confirmations, :challenge_id, :integer, null: false
  end
end
