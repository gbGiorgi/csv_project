# frozen_string_literal: true

class CsvImportService
  require 'csv'

  def initialize(file)
    @file = file
    @count = 0
  end

  def import
    @count = 0
    headers = nil # variable to store the headers

    CSV.foreach(@file.path, headers: true) do |row|
      # Check if headers are present
      if headers.nil?
        headers = row.headers
        # Check if headers match the expected parameters
        raise StandardError, 'Your CSV file doesn\'t have correct parameters' unless headers == %w[id name age]
      end

      id = row['id']
      next unless valid_auto_increment_id?(id)

      begin
        Person.create! row.to_hash
        @count += 1
      rescue ActiveRecord::RecordInvalid => e
        # Handle record creation errors (e.g., validation errors)
        raise StandardError, "Failed to import person: #{e.message}"
      end
    end
  end

  def number_imported_with_last_run
    @count
  end

  private

  def valid_auto_increment_id?(id)
    id.present? && id.to_i.to_s == id
  end
end
