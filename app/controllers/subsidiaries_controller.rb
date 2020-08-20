class SubsidiariesController < ApplicationController
  before_action :carrega_com_um_dado_do_form, only: [:show, :edit, :update]
  before_action :authenticate_user!
  def index
    @subsidiaries = Subsidiary.all 
  end  
  def show
  end  
  def new
    @subsidiary = Subsidiary.new
  end  
  def create
    subsidiary_params = params.require(:subsidiary).permit(:name, :cnpj, :address)
     @subsidiary = Subsidiary.create(subsidiary_params) 
    redirect_to @subsidiary
  end  
  def edit
  end  
  
  def update
    if @subsidiary.update(set_subsidiary_params)
      redirect_to @subsidiary
    else
      render :edit  
    end  
  end 
  
  def set_subsidiary_params
     params.require(:subsidiary).permit(:name, :cnpj, :address) 
  end 
  def carrega_com_um_dado_do_form
     @subsidiary = Subsidiary.find(params[:id])
  end  

end
