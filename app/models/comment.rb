# class Comment < ApplicationRecord
#   belongs_to :post
#   belongs_to :author, class_name: 'User', foreign_key: :author_id
# end

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post'

  attribute :text, :text

  after_create :update_comment_counter
  after_destroy :update_comment_counter

  def update_comment_counter
    post.update(comment_counter: post.comments.count)
  end
end


# first_user = User.create(username: 'sadsif', email: 'saidsf@gmail.com', password: '123545')
# second_user = User.create(username: 'dsadf', email: 'edr@gmail.com', password: 'p343')
