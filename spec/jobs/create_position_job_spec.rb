require 'rails_helper'

RSpec.describe CreatePositionJob, type: :job do
  describe "#perform_later" do
    let(:position_params) { build(:position).attributes.except('id', 'updated_at', 'created_at') }

    it "has been enqueued" do
      ActiveJob::Base.queue_adapter = :test
      expect do
        described_class.perform_later(position_params)
      end.to have_enqueued_job
    end
  end
end
