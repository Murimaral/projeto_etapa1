require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Filial A', cnpj: '99.999.999/0001-99', address: 'Rua Icarai 162')
    Subsidiary.create!(name: 'Filial B', cnpj: '10.101.010/0001-01', address: 'Rua Urumajo 155')
    
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Filial A')
    expect(page).to have_content('Filial B')
  end

  scenario 'and check the details of a chosen subsidiary' do
    
    Subsidiary.create!(name: 'Filial A', cnpj: '99.999.999/0001-99', address: 'Rua Icarai 162')
    Subsidiary.create!(name: 'Filial B', cnpj: '10.101.010/0001-01', address: 'Rua Urumajo 155')

    visit root_path
    click_on 'Filiais'
    click_on 'Filial B'

    expect(page).to have_content('Filial B')
    expect(page).to have_content('10.101.010/0001-01')
    expect(page).to have_content('Rua Urumajo 155')
    expect(page).not_to have_content('Filial A')
  end  

  scenario 'but there is no registered subsidiaries' do
    
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Não há filiais cadastradas')
  end

  scenario 'and return to home page' do
    
    visit root_path
    click_on 'Filiais'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
  
  scenario 'return to subsidiaries list' do
    
    Subsidiary.create!(name: 'Filial A', cnpj: '99.999.999/0001-99', address: 'Rua Icarai 162')

    visit root_path
    click_on 'Filiais'
    click_on 'Filial A'
    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end  

end    