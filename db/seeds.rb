# coding: utf-8

table_names = %w(categories movies users user_movie_state states)
table_names.each do |table_name|
  path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
  if File.exist?(path)
    puts "Creating #{table_name}......"
    puts "#{path}"
    require path
  end
end
