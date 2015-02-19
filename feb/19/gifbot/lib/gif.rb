class Gif < ActiveRecord::Base
  has_many :gif_tags
  has_many :tags, through: :gif_tags
end
