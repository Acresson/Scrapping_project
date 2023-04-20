require 'rest-client'
require 'nokogiri'
require 'open-uri'
def Scrapping_email
page = Nokogiri::HTML(RestClient.get("http://annuaire-des-mairies.com/val-d-oise.html"))


#Recupérer liste ville du 95
tab_villes_95=[]
new_tab_villes_95=[]
tab_villes_95 << page.xpath("//a[@class='lientxt']/@href")
new_tab_villes_95 = tab_villes_95.flatten.map{|string| string.to_s.sub(".","")}
name_villes_95 = new_tab_villes_95.flatten.map{|string| string.to_s.sub("/95/","").sub(".html","")}



#Faire une liste des http de chaque mairies: 
adress_list=[]
list = []
new_tab_villes_95.each do |i|
list = "http://annuaire-des-mairies.com/#{i}"
adress_list << list
end


#Aller récupérer les emails sur chaque site de chaque mairie
new_email_list=[]
adress_list.each do |i|
email_list=[]
page = Nokogiri::HTML(RestClient.get("#{i}"))
email_list << page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
new_email_list << email_list.flatten.map{|string| string.to_s.sub("<td>","").sub("</td>","")}
end

#Zip les tableaux pour en faire un hash k,v
hash_de_villes_et_email=Hash[name_villes_95.zip(new_email_list)] 
array_global = hash_de_villes_et_email.map { |ville, email| {ville => email} }
puts array_global

end

