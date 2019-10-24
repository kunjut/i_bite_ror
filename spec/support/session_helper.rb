def sign_up
  visit new_user_registration_path
    
  fill_in :user_email, with: 'test@bot.com'
  fill_in :user_username, with: 'testBot'
  fill_in :user_password, with: '1234567890'
  fill_in :user_password_confirmation, with: '1234567890'

  click_button 'Sign up'  
end
