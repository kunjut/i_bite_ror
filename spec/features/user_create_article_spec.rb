require 'rails_helper'

feature "Article creation" do
  
  before(:each) do
    sign_up
  end

  # позволяет пользователю попасть на страницу создания статьи
  scenario "allows user to visit new article page" do
    visit new_article_path
    expect(page).to have_content I18n.t('articles.add_new')
  end

  # позволяет пользователю добавить новую статью
  scenario "allows user to add a new article" do
    visit new_article_path

    fill_in :article_title, with: I18n.t('articles.title_stub')
    fill_in :article_content, with: I18n.t('articles.content_stub')

    click_button I18n.t('articles.btn_save_article')

    expect(page).to have_content I18n.t('articles.title_stub')
    expect(page).to have_content I18n.t('articles.content_stub')
  #  expect(page).to have_content I18n.t('current_user.username')
  end
end
