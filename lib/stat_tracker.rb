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
    
        teams = []

        CSV.foreach(locations[:teams], headers: true, header_converters: :symbol) do |row|
            teams << Team.new(row[:team_id], row[:teamname])
        end

        games = []

        CSV.foreach(locations[:games], headers: true, header_converters: :symbol) do |row|
            games << Game.new(
                row[:game_id],
                row[:season],
                row[:away_team_id],
                row[:home_team_id],
                row[:away_goals],
                row[:home_goals]
            )
        end

        game_teams = []

        CSV.foreach(locations[:game_teams], headers: true, header_converters: :symbol) do |row|
            game_teams << GameByTeam.new(
                row[:game_id],
                row[:team_id],
                row[:hoa],
                row[:result],
                row[:head_coach],
                row[:goals],
                row[:shots],
                row[:tackles]
            )
        end

        binding.pry
    end
end 