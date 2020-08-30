require 'rails_helper'

RSpec.describe Car, type: :model do
    describe 'description' do
        it 'should return car model name, car color and car license plate' do
    car_category = CarCategory.create!(name: 'B', daily_rate: 1, 
        car_insurance: 1, third_party_insurance: 1)
    
    car_model = CarModel.create!(name: 'Ka', year: 2018, manufacturer: 'Ford', 
        motorization: '1.0', car_category: car_category, fuel_type: 'Flex') 

        car = Car.create!(license_plate: 'ABC123', color: 'Prata', 
                        car_model: car_model, mileage: 0)

     result = car.description()
     
     
     expect(result).to eq ("Ka - Prata - ABC123")
        end 
    end 
end

