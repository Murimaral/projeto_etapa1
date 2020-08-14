class CarCategory < ApplicationRecord
  dependent: :destroy #se for apagaga essa classe, serao apagadas todas as dependentes dela, tipo car_models
  validates :name, :daily_rate, :car_insurance, :third_party_insurance, presence: {message: 'não pode ficar em branco'}   
  validates :name, uniqueness: {message: 'já está em uso', case_sensitive: false}
end
