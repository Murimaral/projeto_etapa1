require 'rails_helper'

RSpec.describe Rental, type: :model do
    context 'token' do
        it 'generate on create' do
            
      
            client = Client.create!(name: 'Fulano Sicrano', email: 'client@text.com', cpf: '399.479.898-10')
            car_category = CarCategory.create!(name: 'A', daily_rate: 1, 
            car_insurance: 1, third_party_insurance: 1)
            user = User.create!(email: 'user@test.com', name: 'Sicrano Fulano',
            password: '12345678')
            
            
            #rental.reload (re-executa os codigos da criação e save do objeto)

            rental = Rental.new(start_date: Date.current, end_date: 1.day.from_now, client: client, car_category: car_category, user: user)
            rental.save!

            #RAILS_ENV=test rails db:drop db:create db:migrate
            #callback >>> metodos que são acionados automaticamente num contexto, exemplos: before_action, after_commit, before_save, before_create, ,before_validation
            #byebug  >>>>> coloca isso no teste para "parar" o teste nesse momento para poder investigar esse momento de codigo (depois deve-se dar um >>> continue)
            expect(rental.token).to be_present #be_<nome do metodo> é sintaxe para <metodo>? tipo present?
            expect(rental.token.size).to eq 6
            expect(rental.token).to match(/^[A-Z0-9]+$/)
        
        end

        xit 'must be unique' do

        end

    end

   
end
