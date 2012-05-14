class CreateUserlists < ActiveRecord::Migration
  def change
    create_table :userlists do |t|
      t.string :list_name
      t.integer :user_id

      t.timestamps
    end
  end

  add_index :userlists, :user_id
  add_index :userlists, :created_at
end
