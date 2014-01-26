class Friend
  include Mongoid::Document
  include Mongoid::Timestamps

  SOCIAL_STATE = %w[facebook twitter google]
  mount_uploader :avatar, AvatarUploader

  field :email,         :type => String,  :default => ""
  field :name,					:type => String
  field :avatar,        :type => String  

  field :from_social,   :type => String

  belongs_to :user

  def avata_url
    if self.avatar.url.nil?
      ""
    else
      if Rails.env.production?
        self.avatar.url
      else
        "http://192.168.0.55:3005" + self.avatar.url.gsub("#{Rails.root.to_s}/public/user/", "/user/")
      end
    end
  end
  
end
