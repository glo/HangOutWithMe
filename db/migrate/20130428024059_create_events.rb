class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :activity
      t.string :location
      t.integer :organizer_id

      t.timestamps
    end
    add_index :events, [:organizer_id, :created_at]
  end
end
