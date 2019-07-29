require "rails_helper"

RSpec.describe User, type: :model do
  subject {FactoryBot.create :user}
  let(:comments) {FactoryBot.create :comments}

  describe "Create" do
    it { is_expected.to be_valid }
  end

  it "has a valid" do
    expect(subject).to be_valid
  end

  it "is invalid  without a email" do
    subject.email = ""
    expect(subject).to_not be_valid
  end

  describe "Association" do
    it { is_expected.to have_many :comments }
  end
end
