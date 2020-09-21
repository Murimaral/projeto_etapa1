class CarRental < ApplicationRecord
  belongs_to :rental
  belongs_to :car
  belongs_to :user


#Controller
#def finish
    #@car_rental.end_date = Date.current
    #@car_rental.total = @car_rental.calculatE_final_value
    #@car_rental.save
    #redirect_to @car_rental.rental  por causa do has_one

#  no routes
    #recources :car_rentals, only[] do
     # port 'finish', on: :member (objeto associado)
    #end
  
     # na view 
      # <%= link_to 'Finalizar locação', finish_car_rental_path(@car_rental), method: :post %>  






end
