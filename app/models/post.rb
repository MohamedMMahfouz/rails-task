class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :posts_tags
    has_many :tags, through: :posts_tags
    accepts_nested_attributes_for :tags, :allow_destroy => :false
end
