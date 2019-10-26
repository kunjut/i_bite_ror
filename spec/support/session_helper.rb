def sign_up
  visit new_user_registration_path
    
  fill_in :user_email, with: 'test@bot.com'
  fill_in :user_username, with: 'testBot'
  fill_in :user_password, with: '1234567890'
  fill_in :user_password_confirmation, with: '1234567890'

  click_button 'Sign up'  
end

def add_article
  visit new_article_path
  fill_in :article_title, with: I18n.t('articles.title_stub')
  fill_in :article_content, with: I18n.t('articles.content_stub')
  click_button I18n.t('articles.btn_save_article')
end
