require 'csv'
require 'pry'
require_relative 'team'
require_relative 'game'
require_relative 'game_team'
require_relative 'game_stats'
require_relative 'league_stats'
require_relative 'season_stats'

class StatTracker
    attr_reader :games, :teams, :game_teams, :game_stats, :league_stats, :season_stats

    def initialize(teams, games, game_teams)
        @games = games
        @teams = teams
        @game_teams = game_teams
        @game_stats = GameStats.new(games)
        @league_stats = LeagueStats.new(teams, games, game_teams)
        @season_stats = SeasonStats.new(game_teams, teams, games)
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

    def highest_total_score
        @game_stats.highest_total_score
    end

    def lowest_total_score
        @game_stats.lowest_total_score
    end

    def percentage_home_wins
        @game_stats.percentage_home_wins
    end

    def percentage_visitor_wins
        @game_stats.percentage_visitor_wins
    end

    def percentage_ties
        @game_stats.percentage_ties
    end

    def count_of_games_by_season
        @game_stats.count_of_games_by_season
    end

    def average_goals_per_game
        @game_stats.average_goals_per_game
    end

    def average_goals_by_season
        @game_stats.average_goals_by_season
    end

    def count_of_teams
        @league_stats.count_of_teams
    end

    def best_offense
        @league_stats.best_offense
    end

    def worst_offense
        @league_stats.worst_offense
    end

    def highest_scoring_visitor
        @league_stats.highest_scoring_visitor
    end

    def highest_scoring_home_team
        @league_stats.highest_scoring_home_team
    end

    def lowest_scoring_visitor
        @league_stats.lowest_scoring_visitor
    end

    def lowest_scoring_home_team
        @league_stats.lowest_scoring_home_team
    end

    def winningest_coach(season)
        @season_stats.winningest_coach(season)
    end

    def worst_coach(season)
        @season_stats.worst_coach(season)
    end

    def most_accurate_team(season)
        @season_stats.most_accurate_team(season)
    end

    def least_accurate_team(season)
        @season_stats.least_accurate_team(season)
    end

    def most_tackles(season)
        @season_stats.most_tackles(season)
    end

    def fewest_tackles(season)
       @season_stats.fewest_tackles(season)
    end
end
