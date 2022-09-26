require 'rails_helper'

RSpec.describe 'Doctors show page' do 
  before :each do 
    @grey = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    @seaside = Hospital.create!(name: 'Seaside Health & Wellness Center')
    @swedish = Hospital.create!(name: 'Swedish Medical Center')
    @meredith = @grey.doctors.create!(name: 'Meredith Greay', specialty: 'General Surgery', university: 'Harvard University')
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

  it 'will display all the doctors demographic info' do
  # When I visit a doctor's show page
  visit doctor_path(@meredith)
  # I see all of that doctor's information including:
  #  - name
  expect(page).to have_content(@meredith.name)
  #  - specialty
  expect(page).to have_content(@meredith.specialty)
  #  - university where they got their doctorate
  expect(page).to have_content(@meredith.university)
  # And I see the name of the hospital where this doctor works
  expect(page).to have_content(@meredith.hospital)
  # And I see the names of all of the patients this doctor has
  expect(page).to have_content(@meredith.patients)
  #   end
end