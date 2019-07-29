require "rails_helper"

RSpec.describe Comic, type: :model do
  let(:category) {FactoryBot.create :category}
  subject {FactoryBot.create :comic, category_id: category.id}

  context "Create" do
    it {is_expected.to be_valid}
  end

  context "Database" do
    it {is_expected.to have_db_column(:name).of_type :string}
    it {is_expected.to have_db_column(:author).of_type :string}
    it {is_expected.to have_db_column(:description).of_type :text}
    it {is_expected.to have_db_column(:publish_date).of_type :date}
  end

  context "Associations" do
    it {is_expected.to belong_to :category}
  end

  context "Validations" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :author}
    it {is_expected.to validate_presence_of :description}
    it {is_expected.to validate_length_of(:name)
      .is_at_most Settings.comic.name.max_length}
    it {is_expected.to validate_length_of(:author)
      .is_at_most Settings.comic.author.max_length}
    it {is_expected.to validate_length_of(:description)
      .is_at_most Settings.comic.description.max_length}
  end

  context "Scopes" do
    it "returns a sorted array of results that match" do
      a, c, b = ["A", "C", "B"].map {|name| FactoryBot.create :comic,
        name: name, category_id: category.id}

      expect(Comic.name_alphabet).to eq([a,b,c])
    end
  end
end
