require 'rails_helper'

  feature 'Adicionando participante' do
    scenario 'Com sucesso!' do
      visit root_path
      fill_in "participant_name",	with: "Bruno"
      click_on "Adicionar"

      expect(page).to have_content "Bruno"
      expect(page).to have_button "Excluir"
    end

    scenario 'E remove participante' do
      Participant.create!(name: "Bruno")
      
      visit root_path
      click_on "Excluir"

      expect(page).not_to have_content "Bruno"
    end
  end

  feature 'Criando Duplas' do
    scenario 'Com sucesso' do
      Participant.create!(name: "Bruno")
      Participant.create!(name: "Roberto")
      visit root_path
      click_on "Dividir em pares"

      expect(page).to have_content('Bruno e Roberto').or have_content('Roberto e Bruno')
    end

    scenario 'Com duplas já sorteadas' do
      Participant.create!(name: "Bruno")
      Participant.create!(name: "Roberto")
      Pairing.create!(pair: 'Bruno e Roberto')
      Pairing.create!(pair: 'Roberto e Bruno')
      visit root_path
      click_on "Dividir em pares"

      expect(page).to have_content 'Todas as combinações possíveis já foram feitas'
    end

    scenario 'Manualmente' do
      visit root_path
      fill_in 'Participante 1:', with: 'Bruno'
      fill_in 'Participante 2:', with: 'Roberto'
      click_on "Adicionar Par"

      expect(page).to have_content('1. Bruno e Roberto').or have_content('1. Roberto e Bruno')
    end

    scenario 'Manualmente, e dupla já existe' do
      Pairing.create!(pair: 'Bruno e Roberto')
      visit root_path
      fill_in 'Participante 1:', with: 'Bruno'
      fill_in 'Participante 2:', with: 'Roberto'
      click_on "Adicionar Par"

      expect(page).to have_content 'Esta dupla já existe no histórico'
    end
  end
