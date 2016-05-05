require 'rails_helper'

RSpec.describe Post, type: :model do

  it 'is invalid factory' do
    FactoryGirl.create(:post).should be_valid
  end

  it "is valid with title" do
    FactoryGirl.build(:post, title: 'Hello, this is sample testing').should be_valid
  end

  it "is invalid without title" do
    FactoryGirl.build(:post, title: nil).should_not be_valid
  end

  it "is valid with description" do
    FactoryGirl.build(:post, description: 'This spec was generated by rspec-rails when you ran the scaffold generator.
                   It demonstrates how one might use RSpec to specify the controller code that
                   was generated by Rails when you ran the scaffold generator.').should be_valid
  end

  it "is invalid without description" do
    FactoryGirl.build(:post, description: nil).should_not be_valid
  end

  it "is invalid without minimum description characters 20" do
    description = 'below 20characters'
        FactoryGirl.build(:post, description: description).should_not be_valid
  end

end