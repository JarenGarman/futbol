class Game 
    attr_reader :id, :season, :away_id, :home_id, :away_goals, :home_goals 

    def initialize(game_id, season, away_team_id, home_team_id, away_goals, home_goals)
        @id = game_id
        @season = season 
        @away_id = away_team_id
        @home_id = home_team_id
        @away_goals = away_goals
        @home_goals= home_goals
    end
end