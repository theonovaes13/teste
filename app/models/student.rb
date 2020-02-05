class Student < ApplicationRecord
  has_one :user

  validates :matricula, format: {
      with: /\A\d{6}\z/,
      message: "is the wrong length (should be 6 characters)",
  }
  validates :matricula, numericality: {only_integer: true}

  #gurgel botou essa parte ake
  validates :email, uniqueness: { case_sensitive: false }

  scope :por_email, -> email do
    find_by(email: email)
  end


  end


