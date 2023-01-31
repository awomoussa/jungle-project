require 'rails_helper'

RSpec.describe Product, type: :model do
  category= Category.create(name: "compare")
  subject {
    described_class.create(
      name: "Awo",
      price: 5,
      quantity: 10,
      category: category)
  }


  describe 'Validations' do
    it "is a valid product" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
  end
end