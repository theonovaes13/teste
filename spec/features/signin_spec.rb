require 'rails_helper'

RSpec.feature "login", :type => :feature do

  let(:estudante) {
    Student.create(nome: "Theo Novaes", email: "theonovaes@gmail.com", iduff: nil, telefone: '9999-9998', matricula: '321321')
  }

  let(:usuario){
    User.create(email: estudante.email, password: '321321', student_id: estudante.id)
  }

  before(:each ) do
    estudante
  end


  scenario 'usuario entra na home' do
    visit '/'
  end




  scenario 'usuario entra login page' do
    visit '/'
    click_link 'Login'
    visit '/auth/sign_in'
    fill_in "Email", with: usuario.email
    fill_in "Password", with: usuario.password
    click_button "Log in"
    expect(page).to have_text "Signed in successfully."
  end

  scenario 'usuario acessa o index de usuarios' do
    visit '/'
    click_link 'Lista de usuarios'
    expect(page).to have_text "Users"
  end
end

