# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Trail.delete_all



t1 = Trail.create!(name:"Tarn Hows",county:"Cumbria",description:"x",rating:8,distance:11.2)


  t2 = Trail.create!(name:"Kielder Forest",county:"Northumberland",description:"x",lat:55.1833,lng:-2.5000,postcode:"CA16 6QP",rating:9,distance:17.7)

 t3 = Trail.create!(name:"Ullswater",county:"Cumbria",description:"x",lat:54.57467,lng:-2.8715,postcode:"bd24 9qw",rating:10,distance:9.7)

 t4 = Trail.create!(name:"Forest of Bowland",county:"Lancashire",description:"x",rating:8,distance:8.7)

t5 = Trail.create!(name:"Todmorden Way",county:"West Yorkshire",description:"x",lat:53.7130,lng:-2.0960,postcode:"OL14 7BU",rating:7,distance:9.2)

t6 = Trail.create!(name:"Kettlewell Trail",county:"North Yorkshire",description:"x",lat:54.147,lng:-2.0489,postcode:"LA21 8AN",rating:7,distance:9.2)



t7 = Trail.create!(name:"Norfolk Broads",county:"Norfolk",description:"here",lat:52.604,lng:-1.6574,postcode:"here",rating:8,distance:9.4)
t8 = Trail.create!(name:"Little Rissington",county:"Somerset",description:"here",lat:51.863,lng:-1.78082,postcode:"here",rating:8,distance:9.4)




t9 = Trail.create!(name:"Scafell Pike",county:"Cumbria",description:"here",lat:54.456,lng:-3.21218,postcode:"here",rating:8,distance:9.4)
t10 = Trail.create!(name:"Llyn Clywedog",county:"Powys",description:"here",lat:52.4841,lng:-3.62411,postcode:"here",rating:8,distance:9.4)
t11 = Trail.create!(name:"Delamere Forest",county:"Cheshire",description:"here",lat:53.24,lng:-2.693,postcode:"here",rating:8,distance:9.4)

t12 = Trail.create!(name:"Shropshire Hills",county:"Shrophsire",description:"here",lat:2.222,lng:-2.222,postcode:"here",rating:8,distance:9.4)
t13 = Trail.create!(name:"Llyn Dinas",county:"Gwynedd",description:"here",lat:52.461,lng:-2.9608,postcode:"here",rating:8,distance:9.4)
t14 = Trail.create!(name:"Burton Wetlands",county:"Merseyside",description:"here",lat:53.2619,lng:-3.03033,postcode:"here",rating:8,distance:9.4)
t15 = Trail.create!(name:"Old Man of Hoy",county:"Orkneys",description:"here",lat:58.8802,lng:-3.42189,postcode:"here",rating:8,distance:9.4)
t16 = Trail.create!(name:"Shutlingsloe",county:"Cheshire",description:"here",lat:53.219,lng:-2.0408,postcode:"here",rating:8,distance:9.4)