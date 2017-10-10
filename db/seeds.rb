User.destroy_all
Event.destroy_all

anja = User.create!(email: "anja@yahoo.com", password: "231234")
lara = User.create!(email: "lara@gmail.com", password: "123456")
nika = User.create!(email: "nikapika@gmail.com", password: "000000")


party = Category.create!(name: "Party")
educational = Category.create!(name: "Educational")
art = Category.create!(name: "Art")
music = Category.create!(name:"Music")

event1 = Event.create!(name: "Dreamcatcher", description:"Pozivamo vas na dvodnevni event Dreamcatcher u organizaciji udruge Inkubator u prostoru dnevnog boravka u Rojcu.",
location:"Rojc, dnevni boravak, Gajeva 3, Pula", price:5, capacity: 20, includes_food:false, includes_drinks:true,
starts_at: "10/06/2017 20:30",ends_at:"10/20/2017 00:30", active:true, user: anja, categories: [art, educational])
event2 =Event.create!(name: "SoSo Lobi", description:"Iedere vrijdag Fesa bij Waterkant met Soso Lobi, onze liefde voor muziek. Iedere week een ander thema en altijd gratis entree. Koude Parbo Bier djogo's en hete tunes op vrijdag vanaf 23 uur.",
location:"Marnixstraat 246, 1016 TL Amsterdam, Netherlands", price:0, capacity: 100, includes_food:true, includes_drinks:true,
starts_at:"10/06/2017 20:30",ends_at:"10/20/2017 00:30", active:true, user: lara, categories: [party, music])
