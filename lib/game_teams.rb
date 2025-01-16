require 'pry'
class GameTeams 
    attr_reader :game, :team, :hoa, :result, :coach, :goals, :shots, :tackles

    def initialize(game_id, team_id, hoa, result, head_coach, goals, shots, tackles)
        @game = game_id
        @team = team_id
        @hoa = hoa
        @result = result 
        @coach = head_coach
        @goals = goals
        @shots = shots
        @tackles = tackles
    end
end
