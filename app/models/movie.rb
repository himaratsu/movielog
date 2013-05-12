
class Movie < ActiveRecord::Base
  attr_accessible :id, :title, :description, :category_id, :image_url, :image_num, :org_id, :thumbnail_url, :released_at

  #
  #== key でソートした映画情報を返却する
  #
  def self.get_all_data(key)
    # ソートキーが正しくない場合はidでソート
    unless self._is_correct_key(key)
      key = "id"
    end

    order = "DESC"
    # タイトルの場合のみ昇順
    if key == "title" 
      order = "ASC"
    end

    movies = self.find(:all,
                       :order => [key+" "+order],
                      )
    return movies 
  end

  #
  #== ソートキーのバリデーションを行う
  #
  def self._is_correct_key(key)
    # カラム名一覧を配列で取得
    columns = self.column_names
    return columns.include?(key)
  end


end
