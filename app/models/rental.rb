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
  
  def high_season?
    start_of_year = Date.current.beginning_of_year
    start_of_year <= Date.current <= start_of_year + 3.months
  end  




  def scheduled?
     car_rental.blank?
  end
  def in_progress?
    car_rental && car_rental.end_date.blank?
  end
  def finalized?
    car_rental && car_rental.end_date.present?
  end

  private
  def generate_token
      #no caso de atribuiçao é necessario que especifique q nao é pra criar variavel nova e sim usar o SETTER

      self.token = SecureRandom.alphanumeric(6).upcase   
  end  
  
end
