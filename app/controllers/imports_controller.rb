class ImportsController < ApplicationController

  def create
    CsvImportService.new(params[:csv]).call

    render text: 'import ok'
  end
end
