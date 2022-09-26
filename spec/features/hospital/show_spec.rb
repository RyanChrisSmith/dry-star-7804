require 'rails_helper'

RSpec.describe 'Hospital show page' do 
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

  it 'shoulod display all doctors at the hospital' do
    # When I visit a hospital's show page
    visit hospital_path(@grey)
    # I see the hospital's name
    expect(page).to have_content("Grey Sloan Memorial Hospital")
    # And I see the names of all doctors that work at this hospital,
    expect(page).to have_content("Meredith Grey")
    expect(page).to have_content("Derek Shepherd")
    expect(page).to_not have_content("Miranda Bailey")
  end

  it 'will show the number of patients for each doctor and sort from most to least' do
    # And next to each doctor I see the number of patients associated with the doctor,
    visit hospital_path(@grey)

    within("#doctor-#{@meredith.id}") do
      expect(page).to have_content("4 patients")
      expect(page).to_not have_content("2 patients")
    end
    #  And I see the list of doctors is ordered from most number of patients to least number of patients
    expect(@meredith.name).to appear_before(@derek.name)
    #  (Doctor patient counts should be a single query)
  end
end