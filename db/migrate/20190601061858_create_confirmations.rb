class CreateConfirmations < ActiveRecord::Migration[5.2]
  def change
    create_table :confirmations do |t|
      t.string :input
      t.string :expect
      t.timestamps
    end
  end
end
