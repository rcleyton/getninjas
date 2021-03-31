# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Criando usuários..."
User.create!([
  { email: "customer@customer.com", password: "customer", role: 0 },
  { email: "customer2@customer.com", password: "customer2", role: 0 },
  { email: "professional@professional.com", password: "professional", role: 10 }
])
puts "Usuários cadastrados com sucesso"

puts "Criando perfil do usuário..."
Profile.create!([
  { user_id: 1, name: "Leo Gill", phone: "(11) 98877-6655", city: "São Paulo",
   neighborhood: "Pinheiros", street: "Avenida Rebouças", zip_code: "05402-600",
   state: "SP" },
  { user_id: 2, name: "June Cha", phone: "(11) 96655-8877", 
    city: "Itapecerica da Serra", neighborhood: "Centro", 
    street: "Rua Pedro José Rotger Domingues", zip_code: "06850-110", state: "SP" }
])
puts "Perfil criado com sucesso"

puts "Cadastrando pedidos"
Order.create!([
  { profile_id: 1, question_1: "Serviço automotivo", question_2: "Funilaria",
    question_3: "Pintura do teto", response: "Sucesso", latitude: -23.5664259,
    longitude: -46.7030554 },

  { profile_id: 1, question_1: "Procuro encanador", question_2: "Vazamento",
    question_3: "Vazamento de água na cozinha", response: "Sucesso", 
    latitude: -23.5664259, longitude: -46.7030554},

  { profile_id: 1, question_1: "Marcenaria", question_2: "Reforma",
    question_3: "Reformar armário antigo", response: "Sucesso", 
    latitude: -23.5664259, longitude: -46.7030554 },

  { profile_id: 2, question_1: "Procuro pedreiro", question_2: "Construção",
    question_3: "Fazer um muro novo",  response: "Sucesso", 
    latitude: -23.7171973, longitude: -46.8483318 }
])
puts "Pedidos cadastrado com sucesso"