class Tag < ApplicationRecord
    # has_and_belongs_to_many :posts
    has_many :posts_tags
    has_many :posts, through: :posts_tags
end
