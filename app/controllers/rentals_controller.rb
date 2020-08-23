class RentalsController < ApplicationController
   def index
   end

   def new
    @rental = Rental.new
    @clients = Client.all
    @car_categories = CarCategory.all
   end


end
