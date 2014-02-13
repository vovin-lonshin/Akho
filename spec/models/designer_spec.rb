
require 'spec_helper'

describe Designer do

  before { @designer = Designer.new(name: "Example User", email: "user@example.com") }

  subject { @designer }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:daemons)}
  
    it { should be_valid }
  
    describe "when name is not present" do
      before { @designer.name = " " }
      it { should_not be_valid }
    end
    
  describe "when email is not present" do
    before { @designer.email = " " }
    it { should_not be_valid }
  end
  
describe "when name is too long" do
  before { @designer.name = "a" * 43}
  it { should_not be_valid }
end

  describe "when email format is valid" do
      it "should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          @designer.email = valid_address
          expect(@designer).to be_valid
        end
      end
    end
  
  describe "when email address is already taken" do
    before do
      designer_with_same_email = @designer.dup
      designer_with_same_email.email = @designer.email.upcase
      designer_with_same_email.save
    end

    it { should_not be_valid }
  end
    
 end