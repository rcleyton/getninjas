# Descrição

Neste projeto existem dois tipos de usuários, o Cliente, e o Profissional. Ambos devem fazer cadastro na plataforma. Um Cliente deve realizar o cadastro para solicitar um orçamento. Um Profissional deve realizar o cadastro (não possui perfil) para ver todas as solicitações realizadas na plataforma.

# Funcionalidades

- [X] Cliente cria uma conta
- [X] Cliente preenche perfil
- [X] Cliente atualiza perfil
- [X] Cliente solicita um orçamento
- [X] Orçamentos filtrados por ID/Perfil do Cliente
- [X] Cliente não visualiza outros perfis
- [X] Cliente não visualiza orçamentos de outros cliente
- [X] Profissional cria uma conta
- [X] Profissional visualiza todos os pedidos de orçamentos solicitados
- [X] Form de perfil bloqueado para Profissional


# :pushpin: Info
* Ruby 2.7.2
* Rails 6.1.3
* Yarn
* Node
* Redis
* Docker

# :gem: Gems 
* capybara
* devise
* dotenv-rails
* factory_bot_rails
* geocoder
* pg
* rspec_rails
* sidekiq

# :rocket: Detalhes

Esse projeto possui três models: **user**, **profile** e **order**.

O model **user** usado pelo devise, tem por finalidade um melhor gerencimento dos
usuários da plataforma. Junto as funcionalidades de autorização e autenticação,
o método **current_user**, auxilia na gestão dos usuários logados. Além de 
persistir o email e o password do usuário. No momento do cadastro, é permitido 
escolher a função do usuário no sistema. Foi utilizado enum para definir esses 
papéis, com os valores inteiros: 0 para Clientes e 10 para Profissionais.

O model **profile**, é a construção do perfil do Cliente com os seguintes campos:
Nome, Telefone, Cidade, Rua, Bairro, CEP e UF. Ele está associado ao model **user**,
(belongs_to) e o Email é obtido por essa associação. Quando um Cliente realiza o 
cadastro, ele é direcionado para o preenchimento do perfil. Todos os campos são
obrigatórios, portanto validados. Um perfil deve ser único e só é permitidos silicitar
orçamentos após preenche-lo. Neste momomento, o Profissional não é obrigado a ter
um perfil, apenas realizar o cadastro e visualizar os orçamentos solicitados.

O model **order**, está associado aos modelos anteriores e por isso podemos filtrar
as solicitações por perfis. Possui os campos: Question_1, Question_2, Question_3,
Latitude e Longitude. Com o perfil devidamente preenchido, o Cliente consegue fazer
uma solicitação inserindo as informações necessárias nos três primeiros campos.

Quando um Cliente solicita um orçamento, as informações de Question_1, 
Question_2 e Question_3 são persistidas no banco e já podem ser visualizadas na view.
Após salvar a solicitação, um callback no model **order**, chama o método **update_geolocation_async** 
para executar em background passando o **id** da solicitação para o redis. Quando possível,
essa solicitação é executada e através do endereço é obtido a latitude e longitude,
essa informações são persistidas no banco e ficam disponível na view. Quando o processo de
solicitação é concluído, é posível visualizar os dados do Cliente, as questões e os dados geográficos.

# Testes

Para rodar todos os teste
```
rspec
```
Para rodar um teste específico. Ex:
```
rspec ./spec/features/customer_requests_a_service_spec.rb
```