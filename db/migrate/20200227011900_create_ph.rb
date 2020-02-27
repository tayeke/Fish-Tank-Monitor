class CreatePh < ActiveRecord::Migration[6.0]
  def change
    create_table :ph do |t|
      t.float :measure

      t.timestamps
    end
  end
end
