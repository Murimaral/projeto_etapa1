class CarCategoriesController < ApplicationController
  before_action :set_car_category, only: [:edit, :update, :show, :destroy]
  def index
    @car_categories = CarCategory.all
  end    
  def show
  end  
  def new
    @car_category = CarCategory.new
  end  
  def create 
    
    @car_category = CarCategory.new(set_car_category_params)
    if @car_category.save  #com os dados que veio do formulario, da pra salvar?
      redirect_to car_category_path(id: @car_category.id) #tambem poderia por (@car_category) ou redirect_to @car_category
    else
      render :new #ele renderiza porem sem solicitar uma outra action, a view muda mas o controller continua o anterior
      # ao utilizar o redirect_to new_car_category_path, é solicitado uma action do controller e nesse caso, resetaria a variavel @car_category e apagaria os erros do metodo anterior
    end  
  end  
  def edit
  end  

  def update
    if @car_category.update(set_car_category_params)
        redirect_to @car_category
    else
        render :edit
    end   

  end
  def destroy
     @car_category.destroy
     redirect_to car_categories_path
  end  

  def set_car_category
    @car_category = CarCategory.find(params[:id])
  end  
  def set_car_category_params
    params.require(:car_category).permit(:name, :daily_rate, :car_insurance, :third_party_insurance) 
  end
  
  # possivel criar um metodo PRIVATE chamado def car_category_params e no escopo teria params.require(:car_category).permit(:name, :daily_rate, :car_insurance, :third_party_insurance)
end
    