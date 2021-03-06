require 'rails_helper'

feature 'Customer complete profile' do
  scenario 'successfully' do
    customer = create(:user)
    profile = create(:profile)

    login_as customer, scope: :user
    visit new_profile_path

    fill_in "Nome", with: profile.name
    fill_in "Telefone", with: profile.phone
    fill_in "Cidade", with: profile.city
    fill_in "Bairro", with: profile.neighborhood
    fill_in "Rua", with: profile.street
    fill_in "CEP", with: profile.zip_code
    fill_in "UF", with: profile.state
    click_on "Salvar"
    
    expect(page).to have_content(profile.name)
    expect(page).to have_content(profile.phone)
    expect(page).to have_content(profile.city)
    expect(page).to have_content(profile.neighborhood)
    expect(page).to have_content(profile.street)
    expect(page).to have_content(profile.zip_code)
    expect(page).to have_content(profile.state)
    expect(page).to have_content("Perfil criado com sucesso")
  end
  
end