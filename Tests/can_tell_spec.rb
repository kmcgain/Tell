require "rspec"
require "../Src/person"

describe "TellBasicCommand" do

  before :each do
    @person = Person.new "John"
  end

  it "should add basic tell to person" do
    @person.Tell("Hello World!")

    @person.UnreadTells.should be_any {|item| item.to_s() == "Hello World!"}
  end

  it "should not be unread after it is marked as read" do
    @person.Tell "Hi"
    newTell = @person.UnreadTells[0]

    newTell.Read?().should eql false

    content = newTell.Read()
    content.to_s().should eql "Hi"
    newTell.Read?().should eql true
  end
end