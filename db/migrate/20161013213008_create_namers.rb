class CreateNamers < ActiveRecord::Migration
  def change
    create_table :namers do |t|
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
