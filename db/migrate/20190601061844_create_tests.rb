class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :input
      t.string :expect
      t.timestamps
    end
  end
end
