require 'pry'
class SeasonStats
    attr_reader :game_teams, :games, :teams

    def initialize(game_teams, teams, games)
        @game_teams = game_teams
        @teams = teams
        @games = games
    end

    def winningest_coach(season)
        coach_win_percents(season).max_by do |_, average|
            average
        end[0]
    end

  private

    def game_teams_by_season(season)
        # games in the season
        season_games = @games.find_all do |game|
            game.season == season
        end
        # convert games to game_ids
        season_games_ids = season_games.map do |game|
            game.id
        end
        # find game teams by the games id
        @game_teams.find_all do |game_team|
            season_games_ids.include?(game_team.game) # (.game means game_id)
        end
    end

    def coach_games(season)
        # create a hash with coaches as keys and games they coach as values
        coaches_with_games = {}
        game_teams_by_season(season).each do |game_team|
            if coaches_with_games[game_team.coach]
                coaches_with_games[game_team.coach] << game_team
            else
                coaches_with_games[game_team.coach] = [game_team]
            end
        end
        coaches_with_games
    end

    def coach_win_percents(season)
        # create a new hash with coaches a keys and win % as values
        coach_averages = {}
        coach_games(season).each do |coach, game_teams|
            amount_of_games = game_teams.count
            amount_of_wins = game_teams.count do |game_team|
                game_team.result == 'WIN'
            end
            average = amount_of_wins / amount_of_games.to_f
            coach_averages[coach] = average
        end
        coach_averages
    end
end
