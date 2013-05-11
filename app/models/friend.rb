class Friend < ActiveRecord::Base
  attr_accessible :following_id, :followed_id
  validates_presence_of :following_id, :followed_id

  def follow
    @following = where('following_id = ? and followed_id = ?', self.following_id, self.followed_id)
    if @following.present?
      self.update_attribute(:delete_flag, 0)
    else
      self.save
    end
  end

  def self.following(following_id, followed_id)
    @following = self.where('following_id = ? and followed_id = ? and delete_flag = 0', following_id, followed_id).first
    return @following
  end

  def self.is_following(following_id, followed_id)
    @following = self.following(following_id,followed_id)
    return @following.present?
  end

  def self.num_of_following(id)
    return self.where('following_id = ? and delete_flag = 0', id).count
  end

  def self.num_of_followed(id)
    return self.where('followed_id = ? and delete_flag = 0', id).count
  end
end
