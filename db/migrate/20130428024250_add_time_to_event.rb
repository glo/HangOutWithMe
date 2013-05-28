class AddTimeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :start_time, :time
  end
end
