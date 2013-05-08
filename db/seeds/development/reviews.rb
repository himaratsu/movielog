# coding: utf-8

0.upto(50) do |idx|
  Movie.create({
    title: "title_#{idx}",
    description: "description_description_#{idx}",
    category_id: [1, 2, 3, 4, 5][idx % 5],
    image_url: "image_url",
    image_num: [1,2,3,4][idx % 4],
    thumbnail_url: "thumbnail_url",
  }, without_protection: true)
end
