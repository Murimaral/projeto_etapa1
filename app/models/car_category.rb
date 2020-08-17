class CarCategory < ApplicationRecord
  has_many :car_model, dependent: :destroy #se for apagada essa classe, serao apagadas todas as dependentes dela, tipo car_models
  validates :name, :daily_rate, :car_insurance, :third_party_insurance, presence: {message: 'não pode ficar em branco'}   
  validates :name, uniqueness: {message: 'já está em uso', case_sensitive: false}
end
