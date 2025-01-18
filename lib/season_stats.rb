require 'pry'
class SeasonStats
    attr_reader :game_teams, :games, :teams

    def initialize(game_teams, teams, games)
        @game_teams = game_teams
        @teams = teams
        @games = games
    end

    def winningest_coach(season)
        #games in the season 
        #find game teams by the games id 
        #with the game teams find the coach with the best win %
        season_games = @games.find_all do |game|
            game.season == season
        end
        season_games_id = season_games.map do |game|
            game.id
        end
        season_game_teams = @game_teams.find_all do |game_team|
            season_games_id.include?(game_team.game)    # (.game means game_id)
        end
        #create a hash with coaches as keys and games they coach as values 
        #transform the hash into their win % 
        #return coach name with the highest % of wins 
        coaches_game = {}
        season_game_teams.each do |game_team|
            if coaches_game[game_team.coach]
                coaches_game[game_team.coach] << game_team
            else 
                coaches_game[game_team.coach] = [game_team]
            end
        end
        coach_averages = {}
        coaches_game.each do |coach, game_teams|
            amount_of_games = game_teams.count 
            amount_of_wins = game_teams.count do |game_team|
                game_team.result == "WIN"
            end
            average = amount_of_wins / amount_of_games.to_f
            coach_averages[coach] = average 
        end
        coach_averages.max_by do |_, average|
            average
        end[0]
    end
end
