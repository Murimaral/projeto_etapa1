class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  belongs_to :user
  has_one :car_rental

  before_create :generate_token

  
  def total
    number_of_days = end_date - start_date 
    calculo = number_of_days*(car_category.daily_rate+car_category.car_insurance+car_category.third_party_insurance)
  end
  


  private
  def generate_token
      #no caso de atribuiçao é necessario que especifique q nao é pra criar variavel nova e sim usar o SETTER

      self.token = SecureRandom.alphanumeric(6).upcase   
  end  
  
end
