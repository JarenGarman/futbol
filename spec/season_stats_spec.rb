require_relative 'spec_helper'

RSpec.describe SeasonStats do
    subject(:season_stats) do
      StatTracker.from_csv({
                             games: './data/games.csv',
                             teams: './data/teams.csv',
                             game_teams: './data/game_teams.csv'
                           }).season_stats
    end

    describe '#initialize' do
        it { is_expected.to be_instance_of SeasonStats }

        it 'has game_teams' do
            expect(season_stats.game_teams.all?(GameTeam)).to be true
        end
    end
end
