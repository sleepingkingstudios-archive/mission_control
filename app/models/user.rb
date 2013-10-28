class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ### Relations ###
  has_many :missions

  ########################
  ### Instance Methods ###
  ########################

  def admin?
    'admin' == role
  end # method admin?
end # model
