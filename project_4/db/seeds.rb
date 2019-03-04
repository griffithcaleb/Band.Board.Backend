User.destroy_all
Post.destroy_all

nate = User.create!(username: 'nate', email: 'nate@gm.com',
password: '1234',instrument: 'guitar' ,bio: "likes long walks and good books",
locations: "queens ny")
caleb = User.create!(username: 'caleb', email: 'caleb@gm.com',
password: '1234', instrument: 'piano', bio:"single and ready to mingele",
locations:"pittsburgh")



Post.create!(user: nate, title: 'open for business', info:'if You need a
drummer, im your guy', number_of_likes: 0, view: "showAll",author: "Nate" )
Post.create!(user: nate, title: 'need base player', info:'gig this monday, need a
  base player that can play jazz style', number_of_likes: 0, view: "showAll",author: "Nate")
Post.create!(user: nate, title: 'meet up', info:'anyone know where I
  can get a gig?', number_of_likes: 0, view: "showAll",author: "Nate")
Post.create!(user: caleb, title: 'welcome', info:'concert starts at 8', number_of_likes: 0, view: "showAll",author: "caleb")
Post.create!(user: caleb, title: 'need sax man', info:'band name, saxes on fire.
  You in?', number_of_likes: 0, view: "showAll",author: "caleb")
