class RentalsController < ApplicationController
   def index
      @rentals = Rental.all
   end

   def new
    @rental = Rental.new
    @clients = Client.all
    @car_categories = CarCategory.all
   end
   
   def search
      @rentals = Rental.where(token: params[:qualquertok])
      render :index
   end   
   #where() >> acha todos com essas caracteristicas, sempre retorna array de objeto
   # .find_by() acha o primeiro q atenda as condiçoes, retorna um objeto
end
