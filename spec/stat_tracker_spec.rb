require_relative 'spec_helper'

RSpec.describe StatTracker do
    before(:each) do 
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'

    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }
    @tracker = StatTracker.from_csv(locations)

    end

    describe '#initialize' do
        it 'exists' do 
          expect(@tracker).to be_instance_of(StatTracker)
        end

        it 'has no games' do
            expect(@tracker.games).to be_an(Array)
        end

        it 'has no teams' do
            expect(@tracker.teams).to be_an(Array)
        end

        it 'has no game_teams' do
            expect(@tracker.game_teams).to be_an(Array)
        end
    end

    describe '#from_csv' do
        it 'returns instance of StatTracker' do
            game_path = './data/games.csv'
            team_path = './data/teams.csv'
            game_teams_path = './data/game_teams.csv'
            expect(StatTracker.from_csv(locations = {
                games: game_path,
                teams: team_path,
                game_teams: game_teams_path
            })).to be_instance_of StatTracker
        end
    end
end
