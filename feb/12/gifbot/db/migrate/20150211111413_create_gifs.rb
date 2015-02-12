class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :name
      t.string :url
      t.datetime :created_at
      t.integer :views
    end
  end
end
