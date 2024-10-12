class CreatePictures < ActiveRecord::Migration[7.2]
  def change
    create_table :pictures do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :title
      t.string :image_file_path, null: false

      t.timestamps
      t.index [:user_id, :created_at]
    end
  end
end
