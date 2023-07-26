# app/controllers/pages_controller.rb

require 'spreadsheet'

class PagesController < ApplicationController
  def home
    # Generate the XLS file and send it as a download
    generate_xls_file
  end

  def generate_xls_file
    file_path = Rails.root.join('tmp', 'arun.xls').to_s
    workbook = Spreadsheet::Workbook.new
    worksheet = workbook.create_worksheet
    worksheet.row(0).concat(["Arun"])
    workbook.write(file_path)

    # Send the file as a download with the name "arun.xls"
    send_file file_path, filename: 'arun.xls', type: 'application/vnd.ms-excel'
  end
end
