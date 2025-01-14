require 'csv'
require 'pry'
require './lib/team'

class StatTracker
    
    def self.from_csv(locations)
        # instance = self.new

        teams = []

        CSV.foreach(locations[:teams], headers: true, header_converters: :symbol) do |row|
            teams << Team.new(row[:team_id], row[:teamname])
        end

        binding.pry


        # instance 
    end
end 