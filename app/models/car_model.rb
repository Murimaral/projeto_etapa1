class CarModel < ApplicationRecord
  belongs_to :car_category
  validates :name, :year, :manufacturer, :fuel_type, :motorization, presence: true
  has_many :cars 

end

#no model do car category pode ser colocado um has_many (uma categoria pode ser varios modelos de carros)
#um outro exemplo seria uma pessoa tendo um endereço (outra classe) porem nesse caso o endereço teria um has_one e ninguem seria belong