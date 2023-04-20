require_relative "../lib/mairie.rb"

describe "Scrapping_email method" do
  it "returns without error and non-empty array" do
    expect(array_global).not_to be_empty
  end

  it "returns an array of coherent size" do
    expect(array_global.length).to be >= 2
    expect(array_global.length).to be <= 186
  end
end