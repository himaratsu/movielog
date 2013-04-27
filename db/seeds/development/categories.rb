# coding: utf-8

categories = %w(SF Action Documentary Horror Human Romance War Animation Commedy) 
categories.each do |category|
  Category.create({
    title: category
  }, without_protection: true)
end
