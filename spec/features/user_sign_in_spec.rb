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

    scenario 'tries to access car models without autentication' do
     #coisa para fazer quando voltar nesse codigo: completar o teste, usar o arquivo de suporte para nao repetir codigo e continuar video a partir de 1:38:00
          
      
        visit root_path
        click_on 'Modelos de carro'

        #expect(page).to have_link 'Entrar'
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Senha'
        expect(page).to have_link 'Cadastrar'


    end
    scenario 'and logs out' do

       user = User.create!(name: 'Murilo Amaral', email: 'murimaral@gmail.com', password: '123456')
       login_as user

       visit root_path
       click_on 'Sair'

       expect(page).not_to have_link('Sair')
       expect(page).to have_link('Entrar')

    end








     

end
