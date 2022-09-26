class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  validates_presence_of :name
  validates_numericality_of :age
end