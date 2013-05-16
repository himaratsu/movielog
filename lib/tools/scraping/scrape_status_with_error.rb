# -- coding: utf-8

require "open-uri"
require "rubygems"
require "nokogiri"
require "csv"

# urlの先の画像を保存する
def save(org_id, url, name)
  # jpg?以降のノイズを消去
  @path = url.gsub(/(jpg?.*)/, "jpg")

  # 保存先のパスを生成
  p name
  fileName = org_id + "_00#{name}.jpg"
  dirName = "/var/tmp/movielog/img/" + org_id + "/"  
  filePath = dirName + fileName

  # 保存先のディレクトリが存在しなければ作成する
  FileUtils.mkdir_p(dirName) unless FileTest.exist?(dirName)

  # ファイルを書き出し
  open(filePath, 'wb') do |output|
    open(@path) do |data|
      output.write(data.read)
    end
  end
end

# 画像を保存
def save_image(org_id, url, image_index)
  charset = nil
  html = open(url) do |f|
    charset = f.charset
    f.read
  end

  # フォトページをスクレイピング
  doc = Nokogiri::HTML.parse(html, nil, charset)
  doc.xpath('//div[@id="movie_photo"]/a/img').each do |node|
    # 画像URLを取得して保存
    image_url = node.attribute("src").value
    save(org_id, image_url, image_index)
  end
end

# サムネイル画像群を保存
def save_thumbnail(org_id, url, image_index)
  charset = nil
  html = open(url) do |f|
    charset = f.charset
    f.read
  end

  # ギャラリーページをスクレイピング
  doc = Nokogiri::HTML.parse(html, nil, charset)
  doc.xpath('//div[@id="photo"]/a/img').each do |node|
    # サムネイル画像を取得して保存
    thumb_url = node.attribute("src").value
    save(org_id, thumb_url, image_index)
  end
end

# CSV書き出し
def output_csv(title, description, category_id, image_num, released_at, org_id)
  fileName = "#{org_id}.csv"
  dirName = "/var/tmp/movielog/csv/" + org_id + "/"
  filePath = dirName + fileName

  # 保存先のディレクトリが存在しなければ作成する
  FileUtils.mkdir_p(dirName) unless FileTest.exist?(dirName)

  CSV.open(filePath, "w") do |writer|
    writer << [title, description, category_id, image_num, released_at, org_id]
  end
end


#####  ここからメイン #####

# 映画詳細のURLを生成
# org_idはコマンドライン引数から取得
org_id = ARGV[0]
url = "http://eiga.com/movie/" + org_id + "/"

charset = nil
http_status_code = 0
html = open(url) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)

# トップページにリダイレクトされた場合映画情報はないと判断
if doc.title == "作品情報 - 映画.com"
  p "No Match Movie"
  exit()
end

# パース開始
doc.xpath('//div[@class="moveInfoBox"]').each do |node|
  #title
  title = node.xpath('h2').text

  released_at = "2000-00-00"
  begin
    #releaset_at (YYYY-MM-DD)
    released_at = node.xpath('span[@class="opn_date"]/strong').attribute("content").value
  rescue
    released_at = "2000-00-00"
  end

  begin
    #image_url
    image_index = 1
    p node.xpath('//div[@class="pictBox"]/a/img[@class="main"]').attribute("src").value
  rescue
    p "not found image"
  else
    #save image
    poster_url = url+"photo/"
    save_image(org_id, poster_url, image_index)
  end

  #thumbs
  thumbs = node.xpath('//p[@class="thumBox"]/a')
  p thumbs.size
  image_index += 1 
  thumbs.each do |thumb|
    p gallery_url = url+"gallery/#{image_index}/"
    save_thumbnail(org_id, gallery_url, image_index) 
    image_index += 1
  end

  #description
  description = node.xpath('div[@class="outline"]').text
 
  #staff 
  staffs = node.xpath('div[@class="staffcast"]/div[@class="staffBox"]/dl/dd/a')
  staffs.each do |staff|
    # p staff.text
  end

  #casts
  casts = node.xpath('div[@class="staffcast"]/div[@class="castBox"]/ul/li/span/a')
  casts.each do |cast|
    # p cast.text
  end

  output_csv(title, description, 0, image_index, released_at, org_id)

end
