class CarCategoriesController < ApplicationController
  def index
    @car_categories = CarCategory.all
  end    
  def show
    @car_category = CarCategory.find(params[:id])
  end  
  def new
    @car_category = CarCategory.new
  end  
  def create 
    puts '======================'
    car_category_params = params.require(:car_category).permit(:name, :daily_rate, :car_insurance, :third_party_insurance)
    puts '======================'
    @car_category = CarCategory.new(car_category_params)
    if @car_category.save  #com os dados que veio do formulario, da pra salvar?
      redirect_to car_category_path(id: @car_category.id) #tambem poderia por (@car_category) ou redirect_to @car_category
    else
      render :new #ele renderiza porem sem solicitar uma outra action
      # ao utilizar o redirect_to new_car_category_path, é solicitado uma action do controller e nesse caso, resetaria a variavel @car_category e apagaria os erros do metodo anterior
    end  
  end  
  # possivel criar um metodo PRIVATE chamado def car_category_params e no escopo teria params.require(:car_category).permit(:name, :daily_rate, :car_insurance, :third_party_insurance)
end
    