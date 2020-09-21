class Car < ApplicationRecord
  belongs_to :car_model
  has_many :car_rental
  
  enum status: {available:0, rented:10}
  #scope: :available, -> {where(status: :available)} está incluso no enum
  def description
     "#{car_model.name} - #{color} - #{license_plate}"
  end


end
