require_relative 'spec_helper'

RSpec.describe Game do
    subject(:game) { Game.new('2012030221','20122013', '3', '6', '2', '3') }

    describe '#initialize' do
        it { is_expected.to be_instance_of Game }

        it 'has an id' do
            expect(game.id).to eq('2012030221')
        end

        it 'has a season' do
            expect(game.season).to eq('20122013')
        end

        it 'has an away id' do
            expect(game.away_id).to eq('3')
        end

        it 'has a home id' do
            expect(game.home_id).to eq('6')
        end

        it 'has away goals' do
            expect(game.away_goals).to eq('2')
        end

        it 'has home goals' do
            expect(game.home_goals).to eq('3')
        end

    end
end  



