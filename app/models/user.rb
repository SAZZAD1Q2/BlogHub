# class User < ApplicationRecord
#   has_many :posts, foreign_key: :author_id
#   has_many :comments, foreign_key: :author_id
#   has_many :likes

#   validates :username, presence: true, uniqueness: true
#   validates :email, presence: true, uniqueness: true
#   has_secure_password
# end
# first_user = User.create(username: 'ssif', email: 'ssif@gmail.com')
# first_user = User.create(username: 'sdstaaif', email: 'saiesaff@gmail.com', password: '12393345')
# second_user = User.create(username: 'dsaas', email: 'sds@gmail.com', password: '345')

class User < ApplicationRecord
  has_secure_password

  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  attribute :name, :string
  attribute :bio, :text
  attribute :post_counter, :integer, default: 0
  attribute :photo, :string

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end


