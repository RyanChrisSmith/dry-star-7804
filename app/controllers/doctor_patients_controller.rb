class DoctorPatientsController < ApplicationController 
  def destroy 
    dp = DoctorPatient.find_by(doctor_id: params[:id], patient_id: params[:format])
    dp.delete
    redirect_to doctor_path
  end
end