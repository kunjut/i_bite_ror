require 'rails_helper'

feature "Article creation" do
  
  before(:each) do
    sign_up
  end

  #пользователь может попасть на страницу создания статьи?
  scenario "allows user to visit new article page" do
    visit new_article_path
    expect(page).to have_content 'Add new article'
  end
end
