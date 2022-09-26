class DoctorPatientsController < ApplicationController 
  def destroy 
    DoctorPatient.find_by(doctor_id: params[:id], patient_id: params[:format]).delete
    redirect_to doctor_path
  end
end