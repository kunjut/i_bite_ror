class Article < ApplicationRecord

  has_many :comments, dependent: :delete_all

  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true, length: { maximum: 4000 }
  
  def subject
    title
  end

  def last_comment
    comments.last
  end
end
