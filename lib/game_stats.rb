require 'pry'
class GameStats
    attr_reader :games
    def initialize(games)
        @games = games
    end
   
    def highest_total_score
        @games.map do |game|
            game.away_goals + game.home_goals
        end.max
    end

    def lowest_total_score 
        @games.map do |game|
            game.away_goals + game.home_goals
        end.min
    end
    
    def percentage_home_wins
        home_wins = @games.count do |game|
            game.home_goals > game.away_goals
        end
        (home_wins.to_f / @games.length.to_f).round(2)
    end

    def percentage_visitor_wins
        visitor_wins = @games.count do |game|
            game.away_goals > game.home_goals
        end
        (visitor_wins.to_f / @games.length.to_f).round(2)
    end

    def percentage_ties
        ties = @games.count do |game|
            game.away_goals == game.home_goals
        end
        (ties.to_f / @games.length.to_f).round(2)
    end

    def count_of_games_by_season
        seasons = @games.map do |game|
            game.season 
        end.uniq
        seasons.each_with_object({}) do |season, games_per_season|
            games_per_season[season] = @games.count do |game|
                game.season == season 
            end
        end
    end

    def average_goals_per_game 
        total_goals = 0
        @games.each do |game|
            total_goals += (game.home_goals + game.away_goals)
        end
        average_goals = total_goals / @games.count.to_f 
        average_goals.round(2)
    end
end