require 'rails_helper'

RSpec.feature "login", :type => :feature do

  let(:estudante) {
    Student.create(nome: "Theo Novaes", email: "theonovaes@gmail.com", iduff: nil, telefone: '9999-9998', matricula: '321321')
  }

  let(:usuario){
    User.create(email: estudante.email, password: '321321', student_id: estudante.id)
  }
  scenario 'usuario entra na home' do
    visit '/'
  end


  before(:each ) do
    estudante
    usuario
  end

  scenario 'usuario entra login page' do
    visit '/'
    click_link 'Login'
    expect(page).to have_text "Registre-se"
  end
  scenario 'usuario faz login' do
    allow_any_instance_of(User).to receive(:student).and_return(estudante)
    visit '/auth/sign_in'
    fill_in "Email", with: usuario.email
    fill_in "Password", with: usuario.password
    click_button "Log in"
    expect(page).to have_text "Signed in successfully."
  end

end

