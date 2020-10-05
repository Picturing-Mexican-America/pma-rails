class Place < ApplicationRecord
  def self.to_csv
    attributes = ['id', 'en_name', 'en_description', 'category', 'es_name', 'es_description', 'lat', 'lon']
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << user.attributes.values_at(*attributes)
      end
    end
  end

  def self.output_csv(filename)
    File.open("tmp/#{filename}", 'w') { |f| f.write(to_csv) }
  end
end
