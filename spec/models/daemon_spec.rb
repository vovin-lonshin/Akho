require 'spec_helper'

describe Daemon do
  let(:designer) { FactoryGirl.create(:designer) }
    before { @daemon = designer.daemons.build(desire: "Lorem ipsum", name: "LID", phase: "+0-")}
    
  
    subject { @daemon }
  
    it { should respond_to(:desire) }
    it { should respond_to(:name) }
    it { should respond_to(:phase) }  
    it { should respond_to(:designer_id) }
    
      
  describe "when designer_id is not present" do
      before { @daemon.designer_id = nil }
      it { should_not be_valid }
    end
    
  describe "when phase is not same length as name" do
      before { @daemon.phase = @daemon.name+"a" }
      it { should_not be_valid }
    end
  describe "when phase is not + - or 0" do
      before { @daemon.phase = "a" }
      it { should_not be_valid }
    end
    
  describe "when name is not present" do
       before { @daemon.name = nil }
       it { should_not be_valid }
     end
     
    
  describe "when name has non letter character" do
       before { @daemon.name = @daemon.name + "+" }
       it { should_not be_valid }
     end
end


