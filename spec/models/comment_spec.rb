require "rails_helper"

RSpec.describe Comment, type: :model do
  it "is invalid  without content" do
    subject.content = ""
    expect(subject).to_not be_valid
  end

  describe "Association" do
    it { is_expected.to belong_to :user }
  end
end
