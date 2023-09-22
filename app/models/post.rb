class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  attribute :title, :string
  attribute :text, :text
  attribute :comment_counter, :integer, default: 0
  attribute :like_counter, :integer, default: 0

  after_save :update_post_counter

  def update_post_counter
    author.increment!(:post_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
