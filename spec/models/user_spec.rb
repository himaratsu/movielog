# coding: utf-8
require 'spec_helper'

describe User do
  describe 'validate' do
    context 'user model' do
      before do
        @user = User.create(
          :name => 'name',
          :nickname => 'nickname',
          :email => 'name@sample.com',
          :password_digest => 'password_digest',
          :icon_url => 'icon_url',
        )
      end

      # うまくテストできてるかわからない
      it 'has secure password' do
        respond_to @user, :password_digest
        respond_to @user, :authenticate, "User requires has_secure_password"
      end
    end
  end

end
