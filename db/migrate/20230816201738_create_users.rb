class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :post_counter
      # t.datetime :created_at
      # t.datetime :updated_at

      t.timestamps
    end
  end
end
