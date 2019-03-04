User.destroy_all
Post.destroy_all

nate = User.create!(username: 'nate', email: 'nate@gm.com',
password: '1234')
caleb = User.create!(username: 'caleb', email: 'caleb@gm.com',
password: '1234')



Post.create!(user: nate, title: 'open for business', info:'if You need a
drummer, im your guy')
Post.create!(user: nate, title: 'need base player', info:'gig this monday, need a
  base player that can play jazz style')
Post.create!(user: nate, title: 'meet up', info:'anyone know where I
  can get a gig?')
Post.create!(user: caleb, title: 'welcome', info:'concert starts at 8')
Post.create!(user: caleb, title: 'need sax man', info:'band name, saxes on fire.
  You in?')
