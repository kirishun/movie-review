5.times do |i|
  i += 1

  User.create(
    nickname: "user#{i}",
    email: "user#{i}@example.com",
    password: 'password'
  )

  Movie.create(
    title: "movie#{i}",
    director: "director#{i}"    
  )
end

Review.create(body: 'Nice!',   user_id: 1, movie_id: 1)
Review.create(body: 'Greate!', user_id: 1, movie_id: 2)
Review.create(body: 'Bad',     user_id: 3, movie_id: 3)
Review.create(body: 'No good', user_id: 4, movie_id: 3)
Review.create(body: 'worst',   user_id: 5, movie_id: 3)