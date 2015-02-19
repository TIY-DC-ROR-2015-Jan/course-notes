class Gif < ActiveRecord::Base
  has_many :gif_tags
  has_many :tags, through: :gif_tags

  def self.random tag_name=nil
    if tag_name
      t = Tag.where(name: tag_name).first!
      t.gifs.order("RANDOM()").first
    else
      Gif.order("RANDOM()").first
    end
  end
end
