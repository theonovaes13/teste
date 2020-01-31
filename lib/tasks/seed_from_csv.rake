require 'byebug'
require "csv"
namespace :csv_import do
  desc "Seed data.csv from db/csv_seeds to database table"

  task mydata: :environment do
    file = File.open("db/csv_seeds/data.csv", 'r')

    data = CSV.parse(file, headers: true)

    data.each do |line|
      iduff = line.to_h["uffmail"]
      Student.create!(line.to_h.except("status","uffmail").merge(iduff: "#{rand(0..100000)}iduff"))
    end
    puts("File imported")
  end

end

