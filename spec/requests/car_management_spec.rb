require 'rails_helper'

#nao precisa do type: :response pq ja esta na pasta requests
# rails new nome --api cria um api, sem criar pastas de uma app completa como views etc

describe 'Car management'do
    context 'index' do
        it 'renders available cars' do
        #FactoryBot.create_list(:car, status: :available) daria erro pq criaria mesmas categorias de novo
        #car = FactoryBot.create(:car, license_plate:'ABC1234', status::available)
        #FactoryBot.create(:car, license_plate:'ABC9999', status::available, car_model: car.car_model) e assim pro car_category  
            car_category = CarCategory.create!(name: 'A', daily_rate:100, car_insurance: 100,
                                               third_party_insurance: 100)
            car_model = CarModel.create!(name: 'Onix', year: 2019, 
                                    manufacturer: 'Chevrolet', fuel_type: 'Flex',
                                    car_category: car_category, motorization: '1.0')
            Car.create!(license_plate: 'ABC1234', color: 'Vermelho',
                                mileage: 300, car_model: car_model, status: :available) 
            Car.create!(license_plate: 'ABC9999', color: 'Verde',
                                mileage: 200, car_model: car_model, status: :available)
            Car.create!(license_plate: 'ABC0000', color: 'Preto',
                                mileage: 100, car_model: car_model, status: :rented)
  
           
            get '/api/v1/cars'      #v1 = versao 1, podem vir mais ao longo do desenv     
            # to be_ok  to be_not_found
            expect(response).to have_http_status(200)
            body = JSON.parse(response.body, symbolize_names: true)
            expect(body[0][:license_plate]).to eq('ABC1234')
            expect(body.count).to eq 2
            expect(response.body).to include('ABC1234')  
            expect(response.body).to include('ABC9999')  
            expect(response.body).not_to include('ABC0000')         
        end
        it 'renders empty json' do
            get api_v1_cars_path
            
            response_json = JSON.parse(response.body)
            expect(response).to be_ok
            expect(response.content_type).to include('application/json')
            expect(response_json).to be_empty

        end
    end 
    #let(:banana) do create(:car)o let cria uma variavel de forma lazy isto é 
    #só é criada quando é chamada pra uso, tipo banana = car.create

    context 'GET /api/v1/car/:id' do
        context 'record exists' do

            let(:car) do
                create(:car,license_plate: 'ABC1234',
                color: 'Caramelo', status: :available)
            end

            it 'return 200 status' do
                get "/api/v1/cars/#{car.id}"
            
                expect(response).to be_ok
            end
            it 'returns car' do
            

                get "/api/v1/cars/#{car.id}"

                response_json = JSON.parse(response.body, symbolize_names: true)
                expect(response_json[:license_plate]).to eq(car.license_plate)
                expect(response_json[:color]).to eq(car.color)
                expect(response_json[:car_model_id]).to eq(car.car_model_id)
            end
        end
        context 'record doesnt exist' do
            it 'return status code 404' do
                get "/api/v1/cars/000"

                expect(response).to be_not_found
            end
            it 'return not found message' do
                get "/api/v1/cars/000"

                expect(response.body).to include('Carro não encontrado')
            end  
            
        end
    end
    context 'POST /cars' do
        context 'with valid parameters' do
            let(:car_model) {create(:car_model)}
            let(:attributes) { attributes_for(:car, car_model_id: car_model.id) }

                
            it 'returns 201 status' do
                post '/api/v1/cars', params: { car: attributes }

                expect(response).to be_created
            end
            it 'creates a car' do
                post '/api/v1/cars', params: { car: attributes }

                car = JSON.parse(response.body, symbolize_names: true)
                expect(car[:id]).to be_present
                expect(car[:license_plate]).to eq(attributes[:license_plate])
                expect(car[:color]).to eq(attributes[:color])
                expect(car[:car_model_id]).to eq(attributes[:car_model_id])
            end

        end
        context 'with invalid parameters' do
            it 'without car key' do 
                post '/api/v1/cars'

                expect(response).to have_http_status(:precondition_failed)
                expect(response.body).to include('Parâmetros inválidos')
            end
            it 'without requested params' do
                post '/api/v1/cars', params: { car: { foo: 'bar'}}
                

                expect(response).to have_http_status(:unprocessable_entity)
                expect(response.body).to include('Placa não pode ficar em branco')
                expect(response.body).to include('Modelo de carro é obrigatório(a)')
                expect(response.body).to include('Cor não pode ficar em branco')
            end
            xit 'car_model_id not exist' do 
            end
        end
    end

    

end       

