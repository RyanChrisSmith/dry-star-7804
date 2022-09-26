require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_numericality_of :age}
  end

  describe 'class methods' do
    before :each do
      @katie = Patient.create!(name: 'Katie Bryce', age: 24)
      @danny = Patient.create!(name: 'Denny Duquette', age: 39)
      @rebecca = Patient.create!(name: 'Rebecca Pope', age: 32)
      @zola = Patient.create!(name: 'Zola Shepherd', age: 2)
    end

    it '#alphabetical_adult' do
      expect(Patient.alphabetical_adult.first).to eq(@danny)
      expect(Patient.alphabetical_adult.second).to eq(@katie)
      expect(Patient.alphabetical_adult.third).to eq(@rebecca)
    end
  end
end