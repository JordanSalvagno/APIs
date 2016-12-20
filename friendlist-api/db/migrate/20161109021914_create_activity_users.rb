class CreateActivityUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_users do |t|
      t.references :user
      t.references :activity
      t.boolean :accepted, :null => false, :default => "false"
      t.boolean :denied, :null => false, :default => "false"

      t.timestamps
    end
  end
end
