require 'rails_helper'

RSpec.describe PopulationService do

  it "should accept a year we know and return the correct population" do
    expect(PopulationService.get_population(1900)).to eq(76212168)
    expect(PopulationService.get_population(1990)).to eq(248709873)
  end

  it "should accept a year we don't know and return an estimate based on the calculations" do
    expect(PopulationService.get_population(1902)).to eq(79415432)
    expect(PopulationService.get_population(1908)).to eq(89025224)
  end

  it "should accept a year that is before earliest known and return zero" do
    expect(PopulationService.get_population(1800)).to eq(0)
    expect(PopulationService.get_population(0)).to eq(0)
    expect(PopulationService.get_population(-1000)).to eq(0)
  end

  it "should accept a year that is after latest known and return an estimate based on exponential growth" do
    expect(PopulationService.get_population(2000)).to eq(588786718)
    expect(PopulationService.get_population(2050)).to eq(43780720267)
  end
end
