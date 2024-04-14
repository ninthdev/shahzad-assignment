require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should define_enum_for(:status).with_values(active: 'active', inactive: 'inactive').backed_by_column_of_type(:string) }

    it "validates date of birth less than today" do
      user = User.new(first_name: "John", last_name: "Doe", dob: Date.today + 1)
      expect(user).not_to be_valid
      expect(user.errors[:dob]).to include("must be less than #{Date.today}")
    end
  end
end
