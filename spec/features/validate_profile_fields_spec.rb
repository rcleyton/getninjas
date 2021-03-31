require 'rails_helper'

feature 'Validate profile form' do
      scenario 'successfully' do
    customer = create(:user)
    profile = create(:profile)

    login_as customer, scope: :user
    visit new_profile_path

    fill_in "Nome", with: '' 
    fill_in "Telefone", with: '' 
    fill_in "Cidade", with: '' 
    fill_in "Bairro", with: '' 
    fill_in "Rua", with: '' 
    fill_in "CEP", with: '' 
    fill_in "UF", with: '' 
    click_on "Salvar"
    
    expect(page).to have_content("Nome não pode ficar em branco")
    expect(page).to have_content("Telefone não pode ficar em branco")
    expect(page).to have_content("Cidade não pode ficar em branco")
    expect(page).to have_content("Bairro não pode ficar em branco")
    expect(page).to have_content("Rua não pode ficar em branco")
    expect(page).to have_content("CEP não pode ficar em branco")
    expect(page).to have_content("UF não pode ficar em branco")
  end
end