require 'rails_helper'

RSpec.describe ProponentWorker, type: :worker do
  describe '#perform' do
    let(:proponent_id) { 1 }
    let(:attributes) { 3000 }
    let(:proponent) { instance_double(Proponent) }

    before do
      allow(Proponent).to receive(:find).with(proponent_id).and_return(proponent)
      allow(proponent).to receive(:update)
    end

    it 'finds the correct proponent and updates attributes' do
      expect(Proponent).to receive(:find).with(proponent_id).and_return(proponent)
      expect(proponent).to receive(:update).with({:inss_discount=>281.62, :salary=>3000.0})

      ProponentWorker.new.perform(proponent_id, attributes)
    end

    it 'does not raise an error' do
      expect { ProponentWorker.new.perform(proponent_id, attributes) }.not_to raise_error
    end
  end
end
