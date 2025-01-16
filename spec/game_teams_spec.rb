require_relative 'spec_helper'

RSpec.describe GameTeams do
    subject(:game_teams) { GameTeams.new('2012030221', '3', 'away', 'LOSS', 'John Tortorella', '2', '8', '44') }

    describe '#initialize' do
        it { is_expected.to be_instance_of GameTeams }

        it 'has an id' do
            expect(game_teams.game).to eq('2012030221')
        end

        it 'has a team id' do
            expect(game_teams.team).to eq('3')
        end

        it 'has home or away' do
            expect(game_teams.hoa).to eq('away')
        end

        it 'has a result' do
            expect(game_teams.result).to eq('LOSS')
        end

        it 'has a coach' do
            expect(game_teams.coach).to eq('John Tortorella')
        end

        it 'has goals' do
            expect(game_teams.goals).to eq(2)
        end

        it 'has shots' do
            expect(game_teams.shots).to eq(8)
        end

        it 'has tackles' do
            expect(game_teams.tackles).to eq(44)
        end
    end
end







