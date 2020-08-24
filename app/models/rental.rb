class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  belongs_to :user

  before_create :generate_token

  private
  def generate_token
      #no caso de atribuiçao é necessario que especifique q nao é pra criar variavel nova e sim usar o SETTER

      self.token = SecureRandom.alphanumeric(6).upcase   
  end  


end
