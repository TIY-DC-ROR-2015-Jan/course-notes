class AddLastGameToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :tries_left, :integer
    add_column :histories, :answer, :string
    add_column :histories, :guesses, :string
  end
end
