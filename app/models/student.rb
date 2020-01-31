class Student < ApplicationRecord
  has_one :user

  validates :matricula, format: {
      with: /\A\d{6}\z/,
      message: 'aloalo'
  }
  #gurgel botou essa parte ake
  validates :email, uniqueness: { case_sensitive: false }

  scope :por_email, -> email do
    find_by(email: email)
  end


  end


