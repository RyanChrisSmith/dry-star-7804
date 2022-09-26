require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it {should have_many :doctors}
    it {should have_many(:doctor_patients).through(:doctors)}
    it {should have_many(:patients).through(:doctor_patients)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'instance methods' do
    before :each do
      @grey = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
      @seaside = Hospital.create!(name: 'Seaside Health & Wellness Center')
      @swedish = Hospital.create!(name: 'Swedish Medical Center')
      @meredith = @grey.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
      @alex = @seaside.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')
      @miranda = @swedish.doctors.create!(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University')
      @derek = @grey.doctors.create!(name: 'Derek Shepherd', specialty: 'Attending Surgeon', university: 'University of Pennsylvania')
      @katie = Patient.create!(name: 'Katie Bryce', age: 24)
      @danny = Patient.create!(name: 'Denny Duquette', age: 39)
      @rebecca = Patient.create!(name: 'Rebecca Pope', age: 32)
      @zola = Patient.create!(name: 'Zola Shepherd', age: 2)
      DoctorPatient.create!(doctor: @meredith, patient: @katie)
      DoctorPatient.create!(doctor: @meredith, patient: @danny)
      DoctorPatient.create!(doctor: @meredith, patient: @rebecca)
      DoctorPatient.create!(doctor: @meredith, patient: @zola)
      DoctorPatient.create!(doctor: @alex, patient: @katie)
      DoctorPatient.create!(doctor: @alex, patient: @danny)
      DoctorPatient.create!(doctor: @alex, patient: @rebecca)
      DoctorPatient.create!(doctor: @miranda, patient: @katie)
      DoctorPatient.create!(doctor: @miranda, patient: @danny)
      DoctorPatient.create!(doctor: @derek, patient: @zola)
    end

    it '#patient_count' do
      expect(@grey.doctor_patient_count.first.total).to eq(4)
    end
  end
end
