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

    #refactor later with .each_with_object({}) do ?
    def average_goals_by_season
        seasons = @games.map do |game|
            game.season 
        end.uniq
        games_by_season = {}
            seasons.each do |season|
                season_games = []
                @games.each do |game|
                    season_games << game if game.season == season 
                end
                games_by_season[season] = season_games
            end

        avg_goals_by_season = {}
        games_by_season.each do |season, season_games|
            total_games_in_season = season_games.count
            total_goals_in_season = 0
            season_games.each do |game|
                total_goals_in_season += (game.away_goals + game.home_goals)
            end
            average = (total_goals_in_season / total_games_in_season.to_f).round(2)
            avg_goals_by_season[season] = average
        end
        avg_goals_by_season
    end
end