class CarModelsController < ApplicationController
   before_action :set_um_car_model_do_usuario, only: [:show]
   def index
      @car_models = CarModel.all
   end 
   
   def show
      
   end   
   
   def set_um_car_model_do_usuario
      @car_model = CarModel.find(params[:id])
   end


end    