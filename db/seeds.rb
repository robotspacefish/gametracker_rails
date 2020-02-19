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

hk = Game.create(title: "Hollow Knight", summary: summary, added_by: 1 )
me = Game.create(title: "Mass Effect", summary: summary, added_by: 1 )
fnv = Game.create(title: "Fallout: New Vegas", summary: summary, added_by:1 )
botw = Game.create(title: "The Legend of Zelda: Breath of the Wild", summary: summary, added_by: 3 )
g5 = Game.create(title: "Gears 5", added_by: 1 )
tlou = Game.create(title: "The Last of Us", added_by: 2 )
dqb = Game.create(title: "Dragon Quest Builders", added_by: 3 )
dqb2 = Game.create(title: "Dragon Quest Builders 2", added_by:2 )
loz = Game.create(title: "The Legend of Zelda", added_by:3 )
acnh = Game.create(title: "Animal Crossing: New Horizons", summary: "Beloved franchise Animal Crossing gets ready for its Nintendo Switch debut! If the hustle and bustle of modern life's got you down, Tom Nook has a new business venture up his sleeve that he knows you'll adore: the Nook Inc. Deserted Island Getaway Package! Sure, you've crossed paths with colorful characters near and far. Had a grand time as one of the city folk. May've even turned over a new leaf and dedicated yourself to public service! But deep down, isn't there a part of you that longs for.freedom? Then perhaps a long walk on the beach of a deserted island, where a rich wealth of untouched nature awaits, is just what the doctor ordered! Peaceful creativity and charm await as you roll up your sleeves and make your new life whatever you want it to be. Collect resources and craft everything from creature comforts to handy tools. Embrace your green thumb as you interact with flowers and trees in new ways. Set up a homestead where the rules of what goes indoors and out no longer apply. Make friends with new arrivals, enjoy the seasons, pole-vault across rivers as you explore, and more!", added_by: 1 )

xb1 = Platform.create(name: "Xbox One")
switch = Platform.create(name: "Nintendo Switch")
ps4 = Platform.create(name: "PlayStation 4")
pc = Platform.create(name: "PC")
nes = Platform.create(name: "NES")
x360 = Platform.create(name: "Xbox 360")
ps3 = Platform.create(name: "PlayStation 3")
psvita = Platform.create(name: "PlayStation Vita")
Platform.create(name: "Nintendo 3DS")
Platform.create(name: "Xbox")
Platform.create(name: "PlayStation 2")
Platform.create(name: "PlayStation 1")

Platform.create(name: "Mobile")
Platform.create(name: "Web Browser")

hk.platforms << xb1 << ps4 << switch << pc
me.platforms << pc << x360 << ps3
fnv.platforms << pc << x360 << ps3
botw.platforms << switch
g5.platforms << xb1 << pc
tlou.platforms << ps4
dqb.platforms << psvita << ps4 << ps3 << switch
dqb2.platforms << pc << ps4 << switch
loz.platforms << nes
acnh.platforms << switch

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

OwnedGame.first.update(status: "Currently Playing")
OwnedGame.second.update(status: "Completed")
OwnedGame.third.update(status: "Completed")