class Gif < ActiveRecord::Base
  belongs_to :user

  has_many :gif_tags
  has_many :tags, through: :gif_tags

  after_initialize do
    self.views ||= 0
  end

  def self.random tag_name=nil
    if tag_name
      t = Tag.where(name: tag_name).first!
      t.gifs.order("RANDOM()").first
    else
      Gif.order("RANDOM()").first
    end
  end

  def add_tag tag_name
    t = Tag.where(name: tag_name).first_or_create!
    # self.tags << t
    tags << t
  end
end
