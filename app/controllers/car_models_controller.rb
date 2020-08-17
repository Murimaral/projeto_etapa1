class CarModelsController < ApplicationController
   before_action :set_um_car_model_do_usuario, only: [:show]
   

   def index
      @car_models = CarModel.all
   end 
   
   def new
      @car_model = CarModel.new
      @car_categories = CarCategory.all
   end   

   def create
      @car_model = CarModel.new(set_params_from_form)
      if @car_model.save
         redirect_to @car_model
      else
         @car_categories = CarCategory.all  
         render :new 
      end   
   end   

   def show
   end   
   
   def set_um_car_model_do_usuario
      @car_model = CarModel.find(params[:id])
      
   end
   def set_params_from_form
      params.require(:car_model).permit(:name, :year, :manufacturer, :motorization, :fuel_type, :car_category_id)
   end   

end    