require 'rails_helper'

feature 'Professional creates a new account' do
  scenario 'successfully' do
    visit user_session_path
    click_on 'Cadastrar'
    fill_in 'Email', with: 'professional@professional.com.br'
    fill_in 'Senha com mínimo 6 caracteres', with: '123456'
    fill_in 'Repita a senha', with: '123456'
    select 'Profissional', from: 'Cadastrar como'
    click_on 'Cadastrar'

    expect(page).to have_content('Login efetuado com sucesso.')
    expect(page).not_to have_link('Entrar')
    expect(page).to have_link('Sair')
  end
end