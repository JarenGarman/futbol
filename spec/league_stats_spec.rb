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
            #class of GameTeam and instance method should be named the same
        end
    end

    describe '#statistics' do
        
        it '#count_of_teams' do
            expect(league_stats.count_of_teams).to eq(32)
        end

        it '#count_of_games' do #helper method - refactor to private
            expect(league_stats.count_of_games).to eq(7441)
        end

        it '#get_team_name_string' do #helper method - refactor to private
            expect(league_stats.get_team_name_string("54")).to eq("Reign FC")
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

        xit '#highest_scoring_home_team' do
            expect(league_stats.highest_scoring_home_team).to eq("Reign FC")
        end


    end

    
end
