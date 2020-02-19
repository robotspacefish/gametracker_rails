# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username: "jess00", email: "jess00@gmail.com", password: "password")
u2 = User.create(username: "penzo", email: "penzo@gmail.com", password: "password")
u3 = User.create(username: "p1x3l", email: "p1x3l@gmail.com", password: "password")

summary = <<-SUMMARY
  Nullam quis risus eget urna mollis ornare vel eu leo. Aenean lacinia bibendum nulla sed consectetur. Sed posuere consectetur est at lobortis. Donec ullamcorper nulla non metus auctor fringilla.
SUMMARY

g1 = Game.create(title: "Hollow Knight", summary: summary, added_by: 1 )
g2 = Game.create(title: "Mass Effect", summary: summary, added_by: 1 )
g3 = Game.create(title: "Fallout: New Vegas", summary: summary, added_by:1 )
g4 = Game.create(title: "The Legend of Zelda: Breath of the Wild", summary: summary, added_by: 3 )
g5 = Game.create(title: "Gears 5", added_by: 1 )
g6 = Game.create(title: "The Last of Us", added_by: 2 )
g7 = Game.create(title: "Dragon Quest Builders", added_by: 3 )
g8 = Game.create(title: "Dragon Quest Builders 2", added_by:2 )
g9 = Game.create(title: "The Legend of Zelda", added_by:3 )


p1 = Platform.create(name: "Xbox One")
p2 = Platform.create(name: "Nintendo Switch")
p3 = Platform.create(name: "PlayStation 4")
p4 = Platform.create(name: "PC")
p5 = Platform.create(name: "NES")

Platform.create(name: "Nintendo 3DS")
Platform.create(name: "Xbox 360")
Platform.create(name: "Xbox")
Platform.create(name: "PlayStation 3")
Platform.create(name: "PlayStation 2")
Platform.create(name: "PlayStation 1")
Platform.create(name: "PlayStation Vita")
Platform.create(name: "Mobile")
Platform.create(name: "Web Browser")

g1.platforms << p1 << p2 << p3 << p4
g2.platforms << p4
g3.platforms << p4
g4.platforms << p2
g5.platforms << p1 << p4
g6.platforms << p3
g7.platforms << p2 << p3
g8.platforms << p2 << p3 << p4
g9.platforms << p5

u1.add_game_by_games_platform(GamesPlatform.first)
u1.add_game_by_games_platform(GamesPlatform.all[5])

u2.add_game_by_games_platform(GamesPlatform.first)

u3.add_game_by_games_platform(GamesPlatform.third)
u3.add_game_by_games_platform(GamesPlatform.all[7])

OwnedGame.first.notes.create(title: "Donec sed odio dui.", content: "Cras justo odio, dapibus ac facilisis in, egestas eget quam. Cras mattis consectetur purus sit amet fermentum. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Nullam quis risus eget urna mollis ornare vel eu leo.")

OwnedGame.first.notes.create(title: "Integer posuere erat a ante venenatis dapibus posuere velit aliquet.")

OwnedGame.first.notes.create(title: "Lorem ipsum dolor sit")

OwnedGame.second.notes.create(title: "Venenatis Magna Cras")

OwnedGame.second.notes.create(title: "Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.")

OwnedGame.first.update(status: :currently_playing)
OwnedGame.second.update(status: :completed)
OwnedGame.third.update(status: :completed)