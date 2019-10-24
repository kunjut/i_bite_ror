require 'rails_helper'

describe Article do
  
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should validate_length_of(:title).is_at_most(140) }
    it { should validate_length_of(:content).is_at_most(4000) }
  end

  describe "associations" do
    it { should have_many :comments }
  end

  describe "#subject" do
    it "returns the article title" do

      # создаем объект article хитрым способом
      # здесь делаем arrange + act одновременно
      article = create(:article, title: 'Lorem Ipsum')

      # здесь делаем assert (проверку)
      expect(article.subject).to eq 'Lorem Ipsum'

    end
  end

  describe "#last_comment" do
    it "returns the last comment" do
      # создаем статью, но в этот раз с комментариями
      # title уже не вписываем, он же создается автоматом
      article = create(:article_with_comments)

       # здесь делаем assert (проверку)
       expect(article.last_comment.body).to eq "comment body 3"
    end
  end
end
