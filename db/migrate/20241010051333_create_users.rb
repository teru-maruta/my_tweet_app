class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :identification, null: false, index: { unique: true }
      t.string :password, null: false

      t.timestamps
    end
  end
end
