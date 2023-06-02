class DownloaderController < ApplicationController

  def download
    send_data Generator.pdf_clinics_all(Clinic.all),
              filename: "Clinics.pdf",
              type: "application/pdf"
  end
  #
  def downloadAll
    send_data Generator.download_clinic_id(Clinic.find(params[:id])),
              filename: "#{Clinic.find(params[:id]).name}.pdf",
              type: "application/pdf"
  end
  #
  def downloadUsers
    send_data Generator.download_users(User.all),
              filename: "Users.pdf",
              type: "application/pdf"
  end

  def download_csv
    send_data Generator.csv(Clinic.all),
              filename: "Clinics.csv",
              type: "application/csv"
  end

  def clinic_params
    params.require(:clinic).permit(:id)
  end

end