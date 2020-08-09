class HomeController < ApplicationController
   def index
   end
   def show
      @car_categories = CarCategories.all  
   end    
end
    