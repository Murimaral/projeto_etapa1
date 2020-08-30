class CarRentalsController < ApplicationController

    def new
       @rental = Rental.find(params[:rental_id])
       @car_rental =  CarRental.new
       @available_cars = Car.all
    end
    def create 
        @rental = Rental.find(params[:rental_id])
        @car_rental = @rental.build_car_rental(car_rentals_params)
        @car_rental.save!
        redirect_to @rental, notice: "Locação iniciada com sucesso"
    end

    private
    def car_rentals_params
        params.require(:car_rental).permit(:car_id, 
        :driver_license_number).merge(user_id: current_user.id, start_date: Time.zone.now)
    end
    
end