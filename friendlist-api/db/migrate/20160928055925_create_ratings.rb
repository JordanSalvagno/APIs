class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.text :comment
      t.decimal :score
      t.references :user, foreign_key: true
      t.references :rater, foregin_key: true, class_name: "user"
      t.timestamps
    end
  end
end
