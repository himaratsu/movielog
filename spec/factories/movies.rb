Factory.define :movie1, :class => Movie do |m|
  m.title "Iron man 3"
  m.description "story of super hero!"
  m.category_id 1
  m.image_url "http://hoge1.jpg"
  m.image_num 2
  m.thumbnail_url "http://fuga1.jpg"
  m.released_at "2013-05-01 11:11:11"
  m.org_id 1000
end

Factory.define :movie2, :class => Movie do |m|
  m.title "Captain America"
  m.description "he is nice guy."
  m.category_id 10
  m.image_url "http://hoge2.jpg"
  m.image_num 1
  m.thumbnail_url "http://fuga2.jpg"
  m.released_at "2012-04-16 22:22:22"
  m.org_id 3000
end

Factory.define :movie3, :class => Movie do |m|
  m.title "World Order"
  m.description "special dance!"
  m.category_id 4
  m.image_url "http://hoge3.jpg"
  m.image_num 6
  m.thumbnail_url "http://fuga3.jpg"
  m.released_at "2011-11-11 09:09:09"
  m.org_id 2000
end
