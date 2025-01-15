require 'csv'
require 'pry'
require './lib/team'
require './lib/game'
require './lib/game_by_team'

class StatTracker
    attr_reader :games, :teams, :game_teams 

    def initialize
        @games = []
        @teams = []
        @game_teams = []

    end
    
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