require 'rails_helper'

feature 'Customer edit profile' do
  scenario 'successfully' do
    user = User.create!(email: 'teste@teste.com.br', 
                        password: '12345678', id: 100)
    profile = create(:profile, user_id: 100)

    visit dashboard_path
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'
    
    click_on 'Perfil'
    click_on 'Editar Perfil'
    
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
    expect(page).to have_content("Perfil atualizado com sucesso")
  end
end