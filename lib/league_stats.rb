require 'pry'
class LeagueStats
    attr_reader :games, :teams

    def initialize(teams, games)
        @teams = teams
        @games = games
    end
end
