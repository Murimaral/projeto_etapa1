class Api::V1::ApiController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
    private
    def render_not_found(exception)
      render status: :not_found, json: "#{controller_name.classify.constantize.model_name.human} não encontrado"
         #cont name retorna Cars, classify retorna a classe Car, cont retorna o model corresp Car
      #exception.model.constantize.model_name.human seria outra forma   
    end
    def render_record_invalid(exception)
        render status: :unprocessable_entity, json: exception.message
    end
  
    
end