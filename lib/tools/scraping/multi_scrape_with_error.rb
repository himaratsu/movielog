(77200..77250).each do |i|
  code = "ruby scrape_and_output_csv.rb #{i}"
  system(code)
  p "----"
end
