# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

p 'Creating Users'

User.destroy_all

u1=User.create!(
  name: "Brooke",

  contact: "brooke@email.com",
  borrower_history: 1,
  admin: 1,
  password: "password"
)

u2=User.create!(
  name: "Bree",

  contact: "bree@email.com",
  borrower_history: "",
  admin: 0,
  password: "password"

)

u3=User.create!(
  name: "Jeremy",

  contact: "jeremy@email.com",
  borrower_history: "",
  admin: 0,
  password: "password"

)

u4=User.create!(
  name: "Janet",

  contact: "janet@email.com",
  borrower_history: "",
  admin: 0,
  password: "password"

)

puts "Created #{User.count} users"
puts User.pluck(:name).join(',')

p 'Creating Games'

Game.destroy_all

g1= Game.create!(
  title: "Mario Kart",
  borrower_id: nil,
  user_id: u1,
  min_players: 1,
  max_players: 4,
  available: 1,
  category_id: nil,
  description: "Race around tracks as your favourite Nintendo Characters",
  contents: "One physical game cartridge-Nintendo Switch",
  missing_damage: 'n/a',
  box_art: "https://upload.wikimedia.org/wikipedia/en/7/7e/Mario_Kart_64box.png"

)

g2= Game.create!(
  title: "Sagrada",

  user_id: u1,
  min_players: 1,
  max_players: 4,
  available: 1,
  category_id: nil,
  description: "Craft the best stained-glass windows by carefully placing colourful transparent dice",
  contents: "12 Window Pattern cards, 12 Tool Cards, 10 Public Objective Cards, 5 Private Objective Cards, 4 Window Frame Player Boards, 90 Coloured Dice, 1x Dice Bag, 4 Score Markers, 24 Favour Tokens, 1x Round/Score tracker board",
  missing_damage: 'n/a',
  box_art: ""

)

g3= Game.create!(
  title: "Firefly Fluxx",

  user_id: u1,
  min_players: 2,
  max_players: 6,
  available: 1,
  category_id: nil,
  description: "It all begins with one basic rule: Draw One, Play One. As cards are drawn and played from the deck, the rules of the game change from how many cards to play, how many to draw or even how to win",
  contents: "100 cards total,",
  missing_damage: 'n/a',
  box_art: ""

)

g4= Game.create!(
  title: "Tomb Raider",

  user_id: u1,
  min_players: 1,
  max_players: 1,
  available: 0,
  category_id: nil,
  description: "Lara Croft solves puzzles and fights bad guys to survive, HINT: Dont get in Helicopters ever!",
  contents: "Digital copy for Xbox",
  missing_damage: 'n/a',
  box_art: "http://www.superherohype.com/images/stories/2012/October/TR_PC.png"

)
p "Created #{Game.count} games"
p Game.pluck(:title).join(',')


p 'Creating Categories'

Category.destroy_all

c1= Category.create! name: "Board"
c2= Category.create! name: "Video"
c3= Category.create! name: "Card"
c4= Category.create! name: "Playtime < 30min"
c5= Category.create! name: "Playtime < 30min"
c6= Category.create! name: "party"
c7= Category.create! name: "kids"
c8= Category.create! name: "easy"
c9= Category.create! name: "moderate"
c10= Category.create! name: "complex"

p "Created #{Category.count} categories"
p Category.pluck(:name).join(',')


p 'Creating Borrowers'

Borrower.destroy_all


b1= Borrower.create!(
  name: "Brooke",
  start_date: '2020/03/12',
  end_date: "2020/03/15",
  contact_details: 'brooke@email.com',
  user_id: u1
)

b2= Borrower.create!(
  name: "Janet",
  start_date: '2020/03/12',
  end_date: "2020/03/15",
  contact_details: 'janet@email.com',
  user_id: u4
)
b3= Borrower.create!(
  name: "Karina",
  start_date: '2020/03/12',
  end_date: "2020/03/15",
  contact_details: 'karina@email.com',

)
b4= Borrower.create!(
  name: "Bree",
  start_date: '2020/03/12',
  end_date: "2020/03/15",
  contact_details: 'bree@email.com',
  user_id: u2
)

puts "Created #{Borrower.count} borrowers"
puts Borrower.pluck(:name).join(',')

u1.borrower_id << b1.id
u2.borrower_id << b4.id
u4.borrower_id << b2.id
