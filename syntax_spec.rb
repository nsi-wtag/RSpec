RSpec.describe User, type: :model do
  let(:user_with_last_name) { User.create(first_name: "James", last_name: "Anderson") }
  let(:user_without_last_name) { User.create(first_name: "John") }

  describe "#full_name"
    context "when a user has last_name"
      subject { user_with_last_name.full_name }

      it "returns the user's full_name" do
        expect(subject).to eq("James Anderson")
      end
    end

    context "when user doesn't have a last_name"
      subject { user_without_last_name.full_name }

      it "returns an error"
        expect(subject).to raise_error(UserErrors::InvalidLastName)
      end
    end
  end
end

