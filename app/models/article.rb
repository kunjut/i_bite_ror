class Article < ApplicationRecord

  has_many :comments, dependent: :delete_all

  validates :title, presence: true
  validates :content, presence: true

  def subject
    title
  end

  def last_comment
    comments.last
  end
end
