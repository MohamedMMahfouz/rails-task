class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :post_id , :user_id
  # def owner
  #   {owner_id: self.object.user_id,
  #   owner_name: self.object.User.find(self.object.user_id).oname }
  # end
end
