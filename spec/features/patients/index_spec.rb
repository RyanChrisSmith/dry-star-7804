require 'rails_helper'

RSpec.describe 'Patients index page' do 
  before :each do
    @grey = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    @seaside = Hospital.create!(name: 'Seaside Health & Wellness Center')
    @swedish = Hospital.create!(name: 'Swedish Medical Center')
    @meredith = @grey.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
    @alex = @seaside.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')
    @miranda = @swedish.doctors.create!(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University')
    @derek = @grey.doctors.create!(name: 'Derek Shepherd', specialty: 'Attending Surgeon', university: 'University of Pennsylvania')
    @katie = @meredith.patients.create!(name: 'Katie Bryce', age: 24)
    @danny = @meredith.patients.create!(name: 'Denny Duquette', age: 39)
    @rebecca = @meredith.patients.create!(name: 'Rebecca Pope', age: 32)
    @zola = @meredith.patients.create!(name: 'Zola Shepherd', age: 2)
    @katie = @alex.patients.create!(name: 'Katie Bryce', age: 24)
    @danny = @alex.patients.create!(name: 'Denny Duquette', age: 39)
    @rebecca = @alex.patients.create!(name: 'Rebecca Pope', age: 32)
    @katie = @miranda.patients.create!(name: 'Katie Bryce', age: 24)
    @danny = @miranda.patients.create!(name: 'Denny Duquette', age: 39)
    @katie = @derek.patients.create!(name: 'Katie Bryce', age: 24)
  end

  it 'will show all patients in alphabetical order' do
    # When I visit the patient index page
    visit patients_path
    # I see the names of all adult patients (age is greater than 18),
    expect(page).to have_content(@katie.name)
    expect(page).to have_content(@danny.name)
    expect(page).to have_content(@rebecca.name)
    expect(page).to_not have_content(@zola.name)
    # And I see the names are in ascending alphabetical order (A - Z, you do not need to account for capitalization)
    expect(@danny.name).to appear_before(@katie.name)
    expect(@katie.name).to appear_before(@rebecca.name)
  end
end