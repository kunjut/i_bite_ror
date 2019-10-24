require 'rails_helper'

feature "Account creation" do
  #проверка возможности регистрации нового аккаунта
  scenario "allows guest to create account" do
    
    visit new_user_registration_path
    
    fill_in :user_email, with: 'test@bot.com'
    fill_in :user_username, with: 'testBot'
    fill_in :user_password, with: '1234567890'
    fill_in :user_password_confirmation, with: '1234567890'

    click_button 'Sign up'

    expect(page).to have_content I18n.t 'devise.registrations.signed_up'
  end
end
