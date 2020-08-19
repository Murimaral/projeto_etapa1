require 'rails_helper'

feature 'user sign in' do
#objetivo: a partir da tela inicial ir pra tela de login
    scenario 'from home page' do

        visit root_path
        

        expect(page).to have_link 'Entrar' 

    end
    
    scenario 'successfully' do

        User.create!(name: 'Murilo Amaral', email: 'murimaral@gmail.com', password: '123456')


        visit root_path
        click_on 'Entrar'
        fill_in 'Email', with: 'murimaral@gmail.com'
        fill_in 'Senha', with: '123456'
        click_on 'Entrar'   


        expect(page).to have_content('Murilo Amaral')
        expect(page).to have_content 'Login efetuado com sucesso'
        expect(page).to have_link('Sair')
        expect(page).not_to have_link('Entrar')

    end

    scenario 'logs out and tries to access category index' do
     #coisa para fazer quando voltar nesse codigo: completar o teste, usar o arquivo de suporte para nao repetir codigo e continuar video a partir de 1:38:00
    end




     

end
