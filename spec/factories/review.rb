Factory.define :review1, :class => Review do |r|
  r.user_id ""
  r.movie_id 1
  r.rate 1
  r.comment 'hogehoge'
  r.spoiler_flag 1
end

Factory.define :review2, :class => Review do |r|
  r.user_id 1
  r.movie_id 2
  r.rate 1
  r.comment 'hogehoge'
  r.spoiler_flag 1
end

Factory.define :review3, :class => Review do |r|
  r.user_id 1
  r.movie_id ''
  r.rate 1
  r.comment 'hogehoge'
  r.spoiler_flag 1
end

Factory.define :review4, :class => Review do |r|
  r.user_id 1
  r.movie_id 1
  r.rate 1
  r.comment 'hogehoge'
  r.spoiler_flag 1
end
