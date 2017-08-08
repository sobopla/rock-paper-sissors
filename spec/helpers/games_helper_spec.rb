require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GamesHelper module. For example:
#
# describe GamesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end


describe GamesHelper do
  describe "#headline" do
    it "states that the user won when the user won the game" do
      game = Game.new(user_throw: "paper", computer_throw: "rock")

      expect(helper.headline(game)).to eq "User Won!!!"
    end

    it "states that the user lost when the computer won the game" do
      game = Game.new(user_throw: "paper", computer_throw: "scissors")

      expect(helper.headline(game)).to eq "User Lost"
    end
  end


  describe "#result_for_user_throw" do
    context "when the user won the game" do
      it "returns 'covers' when the user threw paper" do
        game = Game.new(user_throw: "paper", computer_throw: "rock")

        expect(helper.result_for_user_throw(game)).to eq "covers"
      end
      it "returns 'cut' when the user threw scissors" do
        game = Game.new(user_throw: "scissors", computer_throw: "paper")
        expect(helper.result_for_user_throw(game)).to eq "cut"
      end

      it "returns 'crushes' when the user threw rock" do
        game = Game.new(user_throw: "rock", computer_throw: "scissors")
        expect(helper.result_for_user_throw(game)).to eq "crushes"
      end
    end

    context "when the computer won the game" do
      it "returns 'is covered by' when the computer threw paper" do
        game = Game.new(user_throw: "rock", computer_throw: "paper")

        expect(helper.result_for_user_throw(game)).to eq "is covered by"
      end
      it "returns 'is cut by' when the computer threw scissors" do
        game = Game.new(user_throw: "paper", computer_throw: "scissors")
        expect(helper.result_for_user_throw(game)).to eq "is cut by"
      end
      it "returns 'is crushed by' when the computer threw rock" do
        game = Game.new(user_throw: "scissors", computer_throw: "rock")
        expect(helper.result_for_user_throw(game)).to eq "is crushed by"
      end
    end
  end

  describe "#throw_color" do
    context "when a user chooses a throw" do
      it "adds a name 'danger' to the class" do
        # game = Game.new(user_throw: "rock")
        expect(helper.throw_color('rock')).to eq "danger"
      end
      it "adds a name 'success' to the class" do
        expect(helper.throw_color('paper')).to eq "success"
      end
      it "adds a name 'info' to the class" do
        expect(helper.throw_color('scissors')).to eq "info"
      end
    end
  end

  describe "#throw_fa_icon" do
    context "when a user chooses a throw" do
      it "adds a name 'fa-hand-rock-o' to the class" do
        # game = Game.new(user_throw: "rock")
        expect(helper.throw_fa_icon('rock')).to eq "fa-hand-rock-o"
      end
      it "adds a name 'fa-hand-stop-o' to the class" do
        expect(helper.throw_fa_icon('paper')).to eq "fa-hand-stop-o"
      end
      it "adds a name 'fa-hand-scissors-o' to the class" do
        expect(helper.throw_fa_icon('scissors')).to eq "fa-hand-scissors-o"
      end
    end
  end

end
