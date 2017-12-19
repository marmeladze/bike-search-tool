# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.create(name: "Bikeomatic2000", manufacturer_url: "bikeomatic2000.com", features: ["steel", "basket", "painted", "cool"])
Product.create(name: "Cycletron 9000", manufacturer_url: "cycletron.com", features: ["steel", "basket", "painted"])
Product.create(name: "Cycletron 8000", manufacturer_url: "bikeomatic2000.com", features: ["steel", "basket", "painted"])
Product.create(name: "Desna-2", manufacturer_url: "desnabikes.com", features: ["steel", "basket", "flying", "lightweight"])
