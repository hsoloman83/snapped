class Tag < ApplicationRecord
  has_many :picture_tags
  has_many :pictures, through: :picture_tags

  def self.most_popular
    #its an array of tags sorted by their usage, how often used
    sorted_tags = Tag.all.sort_by do |tag|
      tag.picture_tags.count
    end.reverse
    #taking out the top three results
  end

  def self.top_three
    most_popular[0..2]
  end

  def self.trending
    pic = Picture.order("created_at DESC").sort_by { |pic| pic.comments.length }.first
    pic.tags.sample
  end

end
