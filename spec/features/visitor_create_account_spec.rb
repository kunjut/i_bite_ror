require 'rails_helper'
require 'support/session_helper'

feature "Account creation" do
  #проверка возможности регистрации нового аккаунта
  scenario "allows guest to create account" do
    sign_up #вызвали метод чтобы регаться
    expect(page).to have_content I18n.t 'devise.registrations.signed_up'
  end
end
