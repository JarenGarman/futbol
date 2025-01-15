require_relative 'spec_helper'

RSpec.describe Team do
  subject(:team) { Team.new('23', 'Reale Pomodoros') }

  describe '#initialize' do
    it { is_expected.to be_instance_of Team }

    it 'has an id' do
      expect(team.id).to eq('23')
    end

    it 'has a name' do
      expect(team.name).to eq('Reale Pomodoros')
    end
  end
end
