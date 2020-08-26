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
      #@rentals = Rental.where(token: params[:qualquertok])
      @rentals = Rental.where('token LIKE ?', "%#{params[:qualquertok]}%")
      # esse argumento do where segue comando SQL,
      #para saber mais acessar SQL Like
      # o ? é tipo um params para SQL, um coringa, que recebe uma string
      #"%#{params[:qualquertok]}%" nesse caso foi necessario essa interpolaçao
      #para evitar conflito com a sintaxe do ruby 
      #% é operador modal
      render :index
   end   
   #where() >> acha todos com essas caracteristicas, sempre retorna array de objeto
   # .find_by() acha o primeiro q atenda as condiçoes, retorna um objeto
end
