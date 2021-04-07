require 'rails_helper'

feature 'Validate order form' do
  #DatabaseCleaner.clean_with(:truncation)
  scenario 'successfully' do
    customer = create(:user)
    profile = create(:profile, user_id: 1)
    order = create(:order)

    login_as customer, scope: :user
    visit root_path
    click_on 'Solicitar orçamento'

    fill_in "Informe a categoria do serviço", with: " "
    fill_in "Informe a subcategoria do serviço", with: " "
    fill_in "Informe os detalhes do serviço", with: " "
    click_on "Criar"
    
    expect(page).to have_content("Informe a categoria do serviço não pode "\
                                 "ficar em branco")
    expect(page).to have_content("Informe a subcategoria do serviço não pode "\
                                 "ficar em branco")
    expect(page).to have_content("Informe os detalhes do serviço não pode "\
                                 "ficar em branco")
  end
end