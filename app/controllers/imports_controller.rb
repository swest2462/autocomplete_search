class ImportsController < ApplicationController

  def create
    CsvImportService.new(params[:csv]).call

    Description.all.each do |x|
      x.update_attributes :value=> x.value.mb_chars.downcase
    end

    render text: 'import ok'
  end
end
