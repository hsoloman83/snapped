class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.string :password_digest

      t.timestamps
    end
  end
end
