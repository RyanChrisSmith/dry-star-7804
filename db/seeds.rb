# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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