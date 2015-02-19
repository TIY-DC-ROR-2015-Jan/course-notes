class AddUsersToGifs < ActiveRecord::Migration
  def change
    add_column :gifs, :user_id, :integer
  end
end
