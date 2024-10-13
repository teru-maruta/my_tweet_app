class CreatePictures < ActiveRecord::Migration[7.2]
  def change
    create_table :pictures do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :title, null: false
      t.string :file_name, null: false, index: { unique: true }

      t.timestamps
      t.index [:user_id, :created_at]
    end
  end
end
