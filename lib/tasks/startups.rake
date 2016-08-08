require 'csv'

namespace :startups do
	desc "import startups from lib/seeds/StartupList.csv"
	task import: :environment do
    Startup.destroy_all # to delete startups without dropping the database
		file = Rails.root.join("lib","seeds","StartupList.csv")
		CSV.foreach(file, headers: true, return_headers: false, header_converters: :symbol) do |row|
			# CSV contains multiple verticals per startup. Your model only supports one vertical per startup.
      p row
			vertical = row[:vertical].capitalize

			# next if verticals.nil?
			# vertical = verticals.is_a?(String)  ? verticals.capitalize : verticals.first.capitalize
			Startup.create!(
			name: row[:company_name],
			website: row[:website],
			address: row[:address],
			latitude: row[:latitude],
			longitude: row[:longitude],
			description: row[:description],
			vertical: vertical,
			employee_count: row[:employee_count],
			stage: row[:stage],
			founded_date: row[:date_added],
      approval: true
			)
		end
	end

end
