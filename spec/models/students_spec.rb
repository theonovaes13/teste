require "rails_helper"

RSpec.describe Student, :type => :model do
  subject { Student.new }
  describe "escopos" do
    let(:estudante) {
      Student.create(nome: "Theo Novaes", email: "theonovaes@gmail.com", iduff: nil, telefone: '9999-9998', matricula: '321321')
    }

    let(:usuario){
      User.create(email: estudante.email, password: '321321', student_id: estudante.id)
    }

    before(:each) do
      usuario
      estudante
    end

    it '.por_email' do
      # estudante.save!
      expect(Student.por_email("theonovaes@gmail.com")).to eq(estudante)
    end
  end

  describe "validates" do
    it { is_expected.to have_one(:user)}
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_numericality_of(:matricula) }

  end
end
    #
    # .on(:create)
# validate_length_of(:matricula).is_equal_to(6).