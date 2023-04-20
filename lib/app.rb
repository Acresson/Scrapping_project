
  require 'rest-client'
  require 'nokogiri'
  require 'open-uri'
def crypto_scrapper
  page = Nokogiri::HTML(RestClient.get("https://coinmarketcap.com/all/views/all/"))


  crypto_price=[]
  crypto_name=[]
  crypto_name_n_price={}

  1.upto(20) do |i|
  crypto_price << page.xpath("/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[5]/div/a/span").to_s.gsub('<span>$','').gsub('</span>','').to_f
  crypto_name << page.xpath("/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[3]/div").to_s.gsub('<div class="">','').gsub('</div>','')
  end

  crypto_name_n_price=Hash[crypto_name.zip(crypto_price)] 
  crypto_liste = crypto_name_n_price.map { |nom, prix| {nom => prix} }
  return crypto_liste
end 

crypto_scrapper