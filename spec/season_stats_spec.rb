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
        
        it 'has games' do
            expect(season_stats.games.all?(Game)).to be true
        end

        it 'has teams' do
            expect(season_stats.teams.all?(Team)).to be true
        end
    end

    it "#winningest_coach" do
    expect(season_stats.winningest_coach("20132014")).to eq "Claude Julien"
    expect(season_stats.winningest_coach("20142015")).to eq "Alain Vigneault"
  end

end
