require 'rails_helper'

feature 'Customer requests a service' do
  scenario 'successfully' do
    user = User.create!(email: 'teste@teste.com.br', 
                        password: '12345678', id: 100)
    profile = create(:profile, user_id: 100)
    order = create(:order)

    visit dashboard_path
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'
    
    click_on 'Solicitar orçamento'

    fill_in 'Informe a categoria do serviço', with: order.question_1
    fill_in 'Informe a subcategoria do serviço', with: order.question_2
    fill_in 'Informe os detalhes do serviço', with: order.question_3
    click_on 'Criar'

    expect(page).to have_content(order.question_1)
    expect(page).to have_content(order.question_3)
    expect(page).to have_content(order.question_3)
    expect(page).to have_content('Pedido criado com sucesso')
  end
end