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

    def count_of_games
        @games.count
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
                binding.pry
            end
            
        # team_total_goals = @game_teams.select do |team_id|
        #     team_id.team == team_id
        
       
                
                # @game_teams.each do |game_team|
                #     team_goals << game_team.goals if game_team.team == team_id
                # end
                # # goals_per_team[team] = team_goals
                # binding.pry
        
        

        #likely need a hash with teamid as key, total goals as value
        # 7441 total games across all szns
        #@id="54", @name="Reign FC"
        
    end
end
