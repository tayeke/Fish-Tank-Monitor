class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.float :measure

      t.timestamps
    end
  end
end
