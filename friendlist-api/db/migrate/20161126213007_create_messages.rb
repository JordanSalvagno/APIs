class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :user_to, foreign_key: true, class_name: "user"
      t.references :user_from, foregin_key: true, class_name: "user"
      t.string :message_body

      t.timestamps
    end
  end
end
