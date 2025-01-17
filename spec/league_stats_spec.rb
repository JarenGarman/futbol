require_relative 'spec_helper'

RSpec.describe LeagueStats do
    subject(:league_stats) do
      StatTracker.from_csv({
                             games: './data/games.csv',
                             teams: './data/teams.csv',
                             game_teams: './data/game_teams.csv'
                           }).league_stats
    end

    describe '#initialize' do
        it { is_expected.to be_instance_of LeagueStats }

        it 'has teams' do
            expect(league_stats.teams.all?(Team)).to be true
        end

        it 'has games' do
            expect(league_stats.games.all?(Game)).to be true
        end
    end
end
