# -- coding: utf-8

require "open-uri"
require "rubygems"
require "nokogiri"

# urlの先の画像を保存する
def save(org_id, url)
  # jpg?以降のノイズを消去
  @path = url.gsub(/(jpg?.*)/, "jpg")

  # 保存先のパスを生成
  fileName = File.basename(@path)
  dirName = "/var/tmp/movielog/" + org_id + "/"  
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
def save_image(org_id, url)
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
    save(org_id, image_url)
  end
end

# サムネイル画像群を保存
def save_thumbnail(org_id, url)
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
    save(org_id, thumb_url)
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
  p node.xpath('h2').text

  begin
    #released_at
    p node.xpath('span[@class="opn_date"]/strong').text
    #releaset_at (YYYY-MM-DD)
    p node.xpath('span[@class="opn_date"]/strong').attribute("content").value
  rescue
    p "not found released_at"
  end

  begin
    #image_url
    p node.xpath('//div[@class="pictBox"]/a/img[@class="main"]').attribute("src").value
  rescue
    p "not found image"
  else
    #save image
    poster_url = url+"photo/"
    save_image(org_id, poster_url)
  end 

  #thumbs
  thumbs = node.xpath('//p[@class="thumBox"]/a')
  p thumbs.size
  thumb_index = 1
  thumbs.each do |thumb|
  #  p thumb.xpath('img').attribute('src').value
   gallery_url = url+"gallery/#{thumb_index}/"
   save_thumbnail(org_id, gallery_url) 
   thumb_index += 1
  end

  #description
  p node.xpath('div[@class="outline"]').text
 
  #staff 
  staffs = node.xpath('div[@class="staffcast"]/div[@class="staffBox"]/dl/dd/a')
  staffs.each do |staff|
    p staff.text
  end

  #casts
  casts = node.xpath('div[@class="staffcast"]/div[@class="castBox"]/ul/li/span/a')
  casts.each do |cast|
    p cast.text
  end

end
