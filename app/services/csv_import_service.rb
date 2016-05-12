# encoding: utf-8

require 'csv'

class CsvImportService
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def call
    clear_existing_descriptions
    insert_new_descriptions
  end

  private

  def clear_existing_descriptions
    Description.delete_all
  end

  def insert_new_descriptions
    CSV.new(file.open, headers: true).each do |hash|
      product_name = hash['Название']
      Description.create(value: product_name)
    end
  end
end
