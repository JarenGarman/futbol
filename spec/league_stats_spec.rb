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

        it 'has game_teams' do
            expect(league_stats.game_teams.all?(GameTeam)).to be true
        end
    end

    describe 'helper methods' do

        it '#get_team_name_string' do 
            expect(league_stats.get_team_name_string("54")).to eq("Reign FC")
        end

        it '#unique_team_id_array' do
            expect(league_stats.unique_team_id_array).to be_an(Array)
        end

        it '#away_ids' do
            expect(league_stats.away_ids).to be_an(Array)
        end

        it '#home_ids' do
            expect(league_stats.home_ids).to be_an(Array)
        end

        it '#goals_per_team_hash' do
            expect(league_stats.goals_per_team_hash).to be_a(Hash)
            expect(league_stats.goals_per_team_hash.keys.count).to eq(32)
        end

        it '#away_goals_per_team_hash' do
            expect(league_stats.away_goals_per_team_hash).to be_a(Hash)
            expect(league_stats.away_goals_per_team_hash.keys.count).to eq(32)
        end

        it '#home_goals_per_team_hash' do
            expect(league_stats.home_goals_per_team_hash).to be_a(Hash)
            expect(league_stats.home_goals_per_team_hash.keys.count).to eq(32)
        end
    end

    describe 'statistics methods' do
        
        it '#count_of_teams' do
            expect(league_stats.count_of_teams).to eq(32)
        end

        it '#best_offense' do
            expect(league_stats.best_offense).to eq("Reign FC")
        end

        it '#worst_offense' do
            expect(league_stats.worst_offense).to eq("Utah Royals FC")
        end

        it '#highest_scoring_visitor' do
            expect(league_stats.highest_scoring_visitor).to eq("FC Dallas")
        end

        it '#highest_scoring_home_team' do
            expect(league_stats.highest_scoring_home_team).to eq("Reign FC")
        end

        it '#lowest_scoring_visitor' do
            expect(league_stats.lowest_scoring_visitor).to eq("San Jose Earthquakes")
        end

        it '#lowest_scoring_home_team' do
            expect(league_stats.lowest_scoring_home_team).to eq("Utah Royals FC")
        end
    end
end
