require_relative 'spec_helper'

RSpec.describe GameTeam do
    subject(:game_team) { GameTeam.new('2012030221', '3', 'away', 'LOSS', 'John Tortorella', '2', '8', '44') }

    describe '#initialize' do
        it { is_expected.to be_instance_of GameTeam }

        it 'has an id' do
            expect(game_team.game).to eq('2012030221')
        end

        it 'has a team id' do
            expect(game_team.team).to eq('3')
        end

        it 'has home or away' do
            expect(game_team.hoa).to eq('away')
        end

        it 'has a result' do
            expect(game_team.result).to eq('LOSS')
        end

        it 'has a coach' do
            expect(game_team.coach).to eq('John Tortorella')
        end

        it 'has goals' do
            expect(game_team.goals).to eq(2)
        end

        it 'has shots' do
            expect(game_team.shots).to eq(8)
        end

        it 'has tackles' do
            expect(game_team.tackles).to eq(44)
        end
    end
end
