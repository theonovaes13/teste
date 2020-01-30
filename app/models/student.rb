class Student < ApplicationRecord
  has_one :user

  validates :matricula, format: {
      with: /\A\d{6}\z/,
      message: 'aloalo'
  }

  scope :por_email, -> email do
    find_by(email: email)
  end


  end


