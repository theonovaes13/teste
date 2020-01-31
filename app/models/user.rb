class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :set_student, on: :create

  belongs_to :student, optional: true
  validates :student_id, uniqueness: true

  # scope :acha_nome, -> user do
  #   select('students.nome').joins(:student).where(id: self.id)
  # end

  def cria_opcao
    nome = self.student.nome.split
    opcoes = []
    opcoes.push(nome[0]+nome[1]+"@id.uff.br")
    opcoes.push(nome[0]+nome[1][0]+ nome[1][1]+"@id.uff.br")
    opcoes.push(nome[0][0] + nome[0][1]+ nome[1]+"@id.uff.br")
    opcoes.push(nome[0]+nome[1][0]+"@id.uff.br")
    opcoes.push(nome[0][0]+nome[1]+"@id.uff.br")
    opcoes
  end



  private

  def set_student
    self.student = Student.find_by(email: email)
  end
end
