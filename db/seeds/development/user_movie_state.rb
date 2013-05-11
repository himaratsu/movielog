# coding: utf-8

0.upto(5) do |idx|
  UserMovieState.create({
    user_id: 1,
    movie_id: idx,
    state_id: 1,
  }, without_protection: true)
end
