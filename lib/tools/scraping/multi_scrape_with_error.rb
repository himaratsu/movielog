(77200..77250).each do |i|
  code = "ruby scrape_status_with_error.rb #{i}"
  system(code)
  p "----"
end
