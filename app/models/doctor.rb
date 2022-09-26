class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  validates_presence_of :name, :specialty, :university

  def self.patient_count
    patients.select("patients.*, count(patients.name) as total")
    .group(:id)
    .order("total desc")
  end
end
