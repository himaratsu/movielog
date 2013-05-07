
class Movie < ActiveRecord::Base
  attr_accessible :id, :title, :description, :category_id, :image_url, :image_num, :org_id, :thumbnail_url, :released_at

  #
  #== key でソートした映画情報を返却する
  #
  def self.get_all_data(key)
    # ソートキーが正しくない場合はidでソート
    key = "id" unless self.is_correct_key(key)

    movies = self.find(:all,
                       :order => ["? DESC", key],
                      )
    return movies 
  end

  #
  #== ソートキーのバリデーションを行う
  #
  def self.is_correct_key(key)
    sort_array = ["id", "title", "category_id", "released_at"]
    return sort_array.include?(key)
  end


end
