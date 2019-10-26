require 'rails_helper'

feature "Article creation" do
  
  before(:each) do
    sign_up
    add_article
  end

  # позволяет пользователю попасть на страницу создания статьи
  scenario "allows user to visit new article page" do
    visit new_article_path
    expect(page).to have_content I18n.t('articles.add_new')
  end

  # позволяет пользователю добавить новую статью
  scenario "allows user to add a new article" do
    expect(page).to have_content I18n.t('articles.title_stub')
    expect(page).to have_content I18n.t('articles.content_stub')
  end

  # проверка добавления комментария к статье
  scenario "allows user add comment to article" do 
    fill_in :comment_body, with: I18n.t('articles.comment')
    click_button I18n.t('articles.btn_save_comment')
    expect(page).to have_content I18n.t('articles.comment')
  end

  # проверка доступа к странице редактирования статьи
  scenario "allows user visit to article editing page" do 
    click_on('Edit')
    expect(page).to have_field(:article_title, with: I18n.t('articles.title_stub'))
    expect(page).to have_content I18n.t('articles.content_stub')
  end

  # проверка успешного редактирования статьи
  scenario "allows user successful article editing" do
    click_on('Edit')
    fill_in :article_title, with: I18n.t('articles.title_upd_stub')
    fill_in :article_content, with: I18n.t('articles.content_upd_stub')
    click_button I18n.t('articles.btn_upd_article')
    expect(page).to have_content I18n.t('articles.title_upd_stub')
    expect(page).to have_content I18n.t('articles.content_upd_stub')  
  end
end
