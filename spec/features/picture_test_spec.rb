require 'rails_helper'

feature 'pic' do
    scenario 'bla' do

    visit root_path

    attach_file 'Foto', Rails.root.join('spec/support/foto_de_carro.jpg') 
    #passa de modo dinamico o endereço (para diferentes usuarios)
     
    

    expect(page).to have_cass('img[src*="foto_de_carro.jpg"]')

 end
end
