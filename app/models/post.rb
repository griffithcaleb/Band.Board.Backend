
class Post < ApplicationRecord
  belongs_to :user

  def self.update id, info
      post = Post.find(id)
      post.update!(title: info[:title], info: info[:info], view: info[:view],
      author: info[:author], number_of_likes: info[:number_of_likes])
  end
end
