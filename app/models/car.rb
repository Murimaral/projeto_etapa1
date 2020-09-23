class Car < ApplicationRecord
  belongs_to :car_model
  has_many :car_rental
  validates :license_plate, :color, presence: true
  
  enum status: {available:0, rented:10}
  #scope: :available, -> {where(status: :available)} está incluso no enum
  def description
     "#{car_model.name} - #{color} - #{license_plate}"
  end
  
  #def j_son(options = {})
  #   super(options.merge(include: :car_model, except: :car_model_id))
  #end
    
end
