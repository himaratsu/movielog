# coding: utf-8

names = ["Kiyoshi", "Ryosuke", "Yonezawa", "Kakimoto", "Adachi", "Nose"]
nicknames = ["himaratsu", "yonestra", "paranichian", "kakkcy", "g", "masaru"]

0.upto(100) do |idx|
  User.create({
    name: names[idx % 6],
    nickname: nicknames[idx % 6],
    email: nicknames[idx % 6]+"@sample.com",
    encrypt_password: SecureRandom::hex(25),
    admin_flag: [0, 1][idx % 2],
    icon_url: "icon_url_#{idx}",
    sex: [0, 1][idx % 2],
    birthday: 10.days.ago.advance(days: idx),
  }, without_protection: true)
end
