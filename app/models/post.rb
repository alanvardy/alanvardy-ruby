# typed: true


class Post < ApplicationRecord
  extend T::Sig

  has_many :taggings
  has_many :tags, through: :taggings

  sig { params(name: String).returns(T::Array[Tag]) }
  def self.tagged_with(name)
    Tag.find_by!(name: name).posts
  end

  sig { returns(Tag::Relation) }
  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  sig { returns(String) }
  def tag_list
    tags.map(&:name).join(', ')
  end

  sig { params(names: String).void}
  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
