class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :tags
  def owner
    {owner_id: self.object.user.id,
    owner_name: self.object.user.name }
  end

  has_many :comments
  has_one :user
  # read has one, has_many for active Model
end
