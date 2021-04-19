require 'csv'

# this class takes a normal release_identifier.csv from discogs
# and strips out non vinyl record entries
class ReleaseIdentifier
  def self.process
    CSV.foreach('tmp/release_format_2.csv', headers: true) do |row|
      CSV.open('tmp/vinyls_2.csv', 'a') do |csv|
        if row['name'].downcase == 'vinyl'
          csv << row
          puts "adding #{row['name']}"
        else
          puts "skipping #{row['name']}"
        end
      end
    end
  end
end
