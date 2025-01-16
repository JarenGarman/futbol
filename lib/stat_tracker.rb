require 'csv'
require 'pry'
require_relative 'team'
require_relative 'game'
require_relative 'game_team'
require_relative 'game_stats'
require_relative 'league_stats'
require_relative 'season_stats'

class StatTracker
    attr_reader :games, :teams, :game_teams, :game_stats

    def initialize(teams, games, game_teams)
        @games = games
        @teams = teams
        @game_teams = game_teams
        @game_stats = GameStats.new(games)
        @league_stats = LeagueStats.new(teams, games)
        @season_stats = SeasonStats.new(game_teams)
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
            game_teams << GameTeam.new(
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
        StatTracker.new(teams, games, game_teams)
    end
end
