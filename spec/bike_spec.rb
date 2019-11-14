require "bikes"

describe Bike do
  it "responds to 'working?' method" do
    expect(subject).respond_to? (:working?)
  end
end