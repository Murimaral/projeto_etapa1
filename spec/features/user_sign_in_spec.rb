require 'rails_helper'

feature 'admin tries to check categories and' do

    scenario 'must be signed in' do

        visit root_path
        click_on 'Categorias'

        expect(page).to have_content 

    end

    xscenario 'successfully' do

        User.create!(name: 'Murilo Amaral', email: 'murimaral@gmail.com', password: '123456')

        
end
