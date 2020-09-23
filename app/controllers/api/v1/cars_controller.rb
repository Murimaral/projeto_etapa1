class Api::V1::CarsController < Api::V1::ApiController
 
  def index
    #hashes sao tranformaveis em json
    render json: Car.available.to_json
  end
  def create
   @car = Car.new(params.require(:car).permit(:license_plate, :color,
                    :mileage, :car_model_id))        
   @car.save!
    render status: :created, json: @car
   #rescue ActiveRecord::RecordInvalid
    #render status: :unprocessable_entity, json: @car.errors.full_messages
   rescue ActionController::ParameterMissing
    render status: :precondition_failed, json: 'Parâmetros inválidos'
  end
    def show
       @car = Car.find(params[:id])
        
        render json: @car if @car
        #rescue StandardError resgata todos os erros
     
    end       
    #def destroy 
     # @car = Car.find(params.require(:car))
    #end     
    

end
