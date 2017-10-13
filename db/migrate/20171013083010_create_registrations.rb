class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.string :status
      t.decimal :price
      t.integer :guests_count

      t.timestamps
    end
  end
end
