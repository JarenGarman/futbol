require 'pry'
class GameTeam
    attr_reader :game, :team, :hoa, :result, :coach, :goals, :shots, :tackles

    def initialize(game_id, team_id, hoa, result, head_coach, goals, shots, tackles)
        @game = game_id     # might want to change this to be @game_id = game_id
        @team = team_id     # might want to change this too
        @hoa = hoa
        @result = result
        @coach = head_coach
        @goals = goals.to_i
        @shots = shots.to_i
        @tackles = tackles.to_i
    end
end
