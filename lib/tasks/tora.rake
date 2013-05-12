#coding: utf-8

namespace :tora do
  desc " it shows db schema with rake tora:schema"

  task :schema => :environment do
    path = Rails.root.join("db/schema.rb")
    if File.exist?(path)
      exec("cat #{path}")
    else
      puts "no such file:"+path.to_s
    end
  end
end
