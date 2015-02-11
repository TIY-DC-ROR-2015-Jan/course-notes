class CreateTagsAndJoinTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
    end

    create_table :gif_tags do |t|
      t.integer :gif_id
      t.integer :tag_id
    end
  end
end
