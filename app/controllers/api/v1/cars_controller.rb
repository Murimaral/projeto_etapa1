class Api::V1::CarsController < Api::V1::ApiController
  def index
    #hashes sao tranformaveis em json
    render json: Car.available.to_json, status: 200
  end
  def create
    @car = Car.new(params.require(:car))
       if @car.save
        render json: @car, status: :created
       else
        render json: @car.errors.full_messages, status: :unprocessable_entity
       end
    end


end
