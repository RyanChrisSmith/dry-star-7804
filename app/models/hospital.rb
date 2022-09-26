class Hospital < ApplicationRecord
  has_many :doctors
  has_many :doctor_patients, through: :doctors
  has_many :patients, through: :doctor_patients

  validates_presence_of :name


  def doctor_patient_count
    doctors
    .select("patients.*, count(patients.name) as total")
    .group(:id)
    .order("total desc")
  end
end
