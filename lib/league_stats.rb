require 'pry'
class LeagueStats
    attr_reader :games, :teams, :game_teams

    def initialize(teams, games, game_teams)
        @teams = teams
        @games = games
        @game_teams = game_teams
    end

    def count_of_teams
        @teams.count
    end

    def count_of_games #helper method
        @games.count
    end

    def get_team_name_string(team_id)
        @teams.find do |team|
            team.id == team_id
        end.name
    end

    def best_offense
        team_ids = @game_teams.map do |game_team| 
            game_team.team
        end.uniq
        goals_per_team = {}
        team_ids.each do |team_id|
            game_team_teams = @game_teams.select do |game_team|
                game_team.team == team_id
            end
            total_goals = game_team_teams.sum do |game_team|
                game_team.goals
            end
            goals_per_team[team_id] = (total_goals.to_f / game_team_teams.count).round(2)
        end
        max_average = goals_per_team.values.max 
        team_id_max_avg = goals_per_team.key(max_average)
        get_team_name_string(team_id_max_avg)
    end

    def worst_offense
        team_ids = @game_teams.map do |game_team| 
            game_team.team
        end.uniq
        goals_per_team = {}
        team_ids.each do |team_id|
            game_team_teams = @game_teams.select do |game_team|
                game_team.team == team_id
            end
            total_goals = game_team_teams.sum do |game_team|
                game_team.goals
            end
            goals_per_team[team_id] = (total_goals.to_f / game_team_teams.count).round(2)
        end
        min_average = goals_per_team.values.min 
        team_id_min_avg = goals_per_team.key(min_average)
        get_team_name_string(team_id_min_avg)
    end

    def highest_scoring_visitor
        away_ids = @games.map do |game|
            game.away_id
        end.uniq
        away_goals_per_team = {}
        away_ids.each do |away_id|
            away_teams = @games.select do |game|
                game.away_id == away_id
            end
            total_away_goals = away_teams.sum do |team|
                team.away_goals
            end
            away_goals_per_team[away_id] = (total_away_goals.to_f / away_teams.count).round(2)
        end
        max_avg_away_goals = away_goals_per_team.values.max
        away_team_id = away_goals_per_team.key(max_avg_away_goals)
        get_team_name_string(away_team_id)
    end
end
