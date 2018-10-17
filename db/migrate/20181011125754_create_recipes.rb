class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :code
      t.string :name
      t.string :url
      t.string :image_url
      t.datetime "created_at", null: false
      t.datetime "update_at", null: false
    end
  end
end
