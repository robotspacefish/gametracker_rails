# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

summary = <<-SUMMARY
  Nullam quis risus eget urna mollis ornare vel eu leo. Aenean lacinia bibendum nulla sed consectetur. Sed posuere consectetur est at lobortis. Donec ullamcorper nulla non metus auctor fringilla.
SUMMARY

g1 = Game.create(title: "Hollow Knight", custom: true, summary: summary)
g2 = Game.create(title: "Mass Effect", custom: true, summary: summary)
g3 = Game.create(title: "Fallout: New Vegas", custom: true, summary: summary)
g4 = Game.create(title: "The Legend of Zelda", custom: true, summary: summary)
g5 = Game.create(title: "Gears of War", custom: true)
g6 = Game.create(title: "The Last of Us")

p1 = Platform.create(name: "Xbox One")
p2 = Platform.create(name: "Nintendo Switch")
p3 = Platform.create(name: "PlayStation 4")
p4 = Platform.create(name: "PC")

g1.platforms << p1 << p2 << p3 << p4
g2.platforms << p4
g3.platforms << p4
g4.platforms << p2
g5.platforms << p1 << p4
g6.platforms << p3


u1 = User.create(username: "jess00", email: "jess00@gmail.com", password: "password")
u2 = User.create(username: "penzo", email: "penzo@gmail.com", password: "password")
u3 = User.create(username: "p1x3l", email: "p1x3l@gmail.com", password: "password")


u1.games_platforms << GamesPlatform.first
u1.games_platforms << GamesPlatform.second
u1.games_platforms << GamesPlatform.all[4]
u1.games_platforms << GamesPlatform.all[5]
u1.games_platforms << GamesPlatform.all[7]
u1.games_platforms << GamesPlatform.all[8]

u2.games_platforms << GamesPlatform.first
u2.games_platforms << GamesPlatform.second
u2.games_platforms << GamesPlatform.third
u2.games_platforms << GamesPlatform.all[6]
u2.games_platforms << GamesPlatform.all[8]

u3.games_platforms << GamesPlatform.third
u3.games_platforms << GamesPlatform.all[7]
u3.games_platforms << GamesPlatform.all[8]


OwnedGame.first.notes.create(title: "Donec sed odio dui.", content: "Cras justo odio, dapibus ac facilisis in, egestas eget quam. Cras mattis consectetur purus sit amet fermentum. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Nullam quis risus eget urna mollis ornare vel eu leo.", objective_type: "next")

OwnedGame.first.notes.create(title: "Integer posuere erat a ante venenatis dapibus posuere velit aliquet.")

OwnedGame.first.notes.create(title: "Lorem ipsum dolor sit", objective_type: "last")

OwnedGame.second.notes.create(title: "Venenatis Magna Cras", objective_type: "next")

OwnedGame.second.notes.create(title: "Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.", objective_type: "last")

OwnedGame.first.update(currently_playing: true)
OwnedGame.all[7].update(completed: true)
OwnedGame.all[4].update(completed: true)
OwnedGame.all[9].update(completed: true)


# User.all.each do |user|
#   total_gp = rand(6)

#   total_gp.times do
#     gp = GamesPlatform.all.sample

#     if !user.games_platforms.include?(gp)
#       user.games_platforms << gp
#     end
#   end
# end