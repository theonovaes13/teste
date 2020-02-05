require 'rails_helper'

RSpec.feature "signin", :type => :feature do
  let(:estudante) {
    Student.create(nome: "Theo Novaes", email: "theonovaes@gmail.com", iduff: nil, telefone: '9999-9998', matricula: '321321')
  }

  let(:usuario){
    User.new(email: estudante.email, password: '321321', student_id: estudante.id)
  }

  before(:each ) do

  end



  scenario "usuario escolhe uma opção", js: true do
    estudante
    usuario
    visit '/auth/sign_up'
    fill_in "Email", with: estudante.email
    fill_in "Password", with: '321321'
    fill_in "Password confirmation", with: '321321'
    click_button "Sign up"

    visit "/students/#{estudante.id}/edit"
    find("#student_iduff_theonovaesid_uff_br").choose
    click_on "Update Student"

    expect(page).to have_text "Informações de"
    sleep(5)
  end

end
