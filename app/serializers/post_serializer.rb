class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :owner, :comments, :tags
  def owner
    {owner_id: self.object.user.id,
    owner_name: self.object.user.name }
  end
  
end
