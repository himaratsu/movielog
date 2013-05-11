class Friend < ActiveRecord::Base
  attr_accessible :following_id, :followed_id
  validates_presence_of :following_id, :followed_id

  def self.following(following_id, followed_id)
    @following = self.where('following_id = ? and followed_id = ?', following_id, followed_id).first
    return @following
  end

  def self.is_following(following_id, followed_id)
    @following = self.following(following_id,followed_id)
    puts @following
    puts @following.blank?
    return @following.present?
  end

end
