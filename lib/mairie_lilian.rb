require 'nokogiri'
require 'open-uri'

def get_ville

  region_page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))

  return ville_name_array = region_page.xpath("//a[contains(@class, 'lientxt')]/text()").map {|x| x.to_s.downcase.gsub(" ", "-") }

end

def get_email (ville_names)

  ville_email_array = []

  # Boucle sur chaque ville du tableau pour obtenir l'e-mail
  for n in 0...ville_names.length

    ville_page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/95/#{ville_names[n]}.html"))

    ville_email_array << ville_page.xpath("//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]/text()").to_s

  end

  return ville_email_array
end

puts email_ville_result = Hash[get_ville.zip(get_email(get_ville))]