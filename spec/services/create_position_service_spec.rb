require 'rails_helper'

RSpec.describe CreatePositionService do
  
  describe '#perform' do
    subject { CreatePositionService.new(position_attributes) }
    
    let(:position_attributes) { build(:position).attributes.except('id', 'updated_at', 'created_at') }
    
    context 'when execution is successfully' do

      it 'is success' do
        expect(subject.perform).to be_truthy
      end
      
      it 'creates new vehicle and position' do
        expect { subject.perform }.to change{Vehicle.count}.by(1)
        expect { subject.perform }.to change{Position.count}.by(1)
      end
    end

    context 'when vehicle exists' do
      let!(:vehicle) { create(:vehicle) }
      let(:position_attributes) { build(:position, vehicle_identifier: vehicle.identifier).attributes.except('id', 'updated_at', 'created_at') }
      subject { CreatePositionService.new(position_attributes) }
      
      it 'is success' do
        expect(subject.perform).to be_truthy
      end
      
      it 'creates new position' do
        expect { subject.perform }.to change{Vehicle.count}.by(0)
        expect { subject.perform }.to change{Position.count}.by(1)
      end
    end

    context 'when position params are invalid' do
      
      subject { CreatePositionService.new({ latitude: nil, longitude: nil }) }
      
      it 'fails' do
        expect(subject.perform).to be_falsy
      end
    end

    context 'private methods' do
      
      context 'when vehicle params are invalid' do
        let(:vehicle) { create(:vehicle) }
        subject { CreatePositionService.new({ vehicle_identifier: nil }) }
        
        it 'returns false' do
          expect(subject.send(:can_find_or_create_vehicle?)).to be_falsy
        end
      end
    end
  end
end