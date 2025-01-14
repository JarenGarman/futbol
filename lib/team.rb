
class Team 
    attr_reader :id, :name

    def initialize(team_id, teamname)
        @id = team_id
        @name = teamname
    end
end