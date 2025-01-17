require_relative 'spec_helper'

RSpec.describe StatTracker do
    subject(:tracker) do
    StatTracker.from_csv({
                           games: './data/games.csv',
                           teams: './data/teams.csv',
                           game_teams: './data/game_teams.csv'
                         })
    end

    describe '#from_csv' do
        it { is_expected.to be_instance_of StatTracker }

        it 'has games' do
            expect(tracker.games.all?(Game)).to be true
        end

        it 'has teams' do
            expect(tracker.teams.all?(Team)).to be true
        end

        it 'has game_teams' do
            expect(tracker.game_teams.all?(GameTeam)).to be true
        end

        it 'has game_stats' do
            expect(tracker.game_stats).to be_instance_of GameStats
        end

        it 'has league_stats' do
            expect(tracker.league_stats).to be_instance_of LeagueStats
        end

        it 'has season_stats' do
            expect(tracker.season_stats).to be_instance_of SeasonStats
        end
    end
end
