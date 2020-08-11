class HomeController < ApplicationController
   def index
   end
   def show #acho que essa funçao show esta errada aí mas nao tenho certeza
      @car_categories = CarCategories.all  
   end    
end
    