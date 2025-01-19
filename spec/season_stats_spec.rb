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

    describe 'statistics methods' do
        it '#winningest_coach' do
            expect(season_stats.winningest_coach('20132014')).to eq('Claude Julien')
            expect(season_stats.winningest_coach('20142015')).to eq('Alain Vigneault')
        end

        it '#worst_coach' do
            expect(season_stats.worst_coach('20132014')).to eq('Peter Laviolette')
            expect(season_stats.worst_coach('20142015')).to eq('Craig MacTavish').or eq('Ted Nolan')
        end

        it '#most_accurate_team' do
            expect(season_stats.most_accurate_team('20132014')).to eq('Real Salt Lake')
            expect(season_stats.most_accurate_team('20142015')).to eq('Toronto FC')
        end

        it '#least_accurate_team', skip: 'Not implemented yet' do
            expect(season_stats.least_accurate_team('20132014')).to eq('New York City FC')
            expect(season_stats.least_accurate_team('20142015')).to eq('Columbus Crew SC')
        end

        it '#most_tackles', skip: 'Not implemented yet' do
            expect(season_stats.most_tackles('20132014')).to eq('FC Cincinnati')
            expect(season_stats.most_tackles('20142015')).to eq('Seattle Sounders FC')
        end

        it '#fewest_tackles', skip: 'Not implemented yet' do
            expect(season_stats.fewest_tackles('20132014')).to eq('Atlanta United')
            expect(season_stats.fewest_tackles('20142015')).to eq('Orlando City SC')
        end
    end
end
