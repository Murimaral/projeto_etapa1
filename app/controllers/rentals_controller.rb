class RentalsController < ApplicationController
   def index
   end

   def new
    @rental = Rental.new
   end


end
