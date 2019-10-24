require 'rails_helper'

feature "Contact creation" do
  #проверка доступа к странице
  scenario "allows access to contacts page" do
    visit '/contacts'
    expect(page).to have_content I18n.t 'contacts.contact_me'
  end
  #проверка возможности создать сообщение в форме контакта
  scenario "allows a guest to create contact" do
    visit '/contacts'
    fill_in 'contact_email', with: 'user@example.com'
    fill_in 'contact_message', with: 'So, hi, hello!'
    click_button 'Send Message'
    expect(page).to have_content 'Thanks'
  end
end
