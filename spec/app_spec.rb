require_relative "../lib/app.rb"

describe "crypto_scrapper method" do
  it "returns without error and non-empty array" do
    expect(crypto_scrapper).not_to be_empty
  end

  it "returns an array of coherent size" do
    expect(crypto_scrapper.length).to be >= 2
    expect(crypto_scrapper.length).to be <= 21
  end
end