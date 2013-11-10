# app/models/mission.rb

class Mission < ActiveRecord::Base
  ### Fields ###
  # user_id:integer
  # name:string
  # status:string
  # created_at:datetime
  # updated_at:datetime

  def self.status
    [ 'cancelled',
      'failure',
      'in progress',
      'planned',
      'success'
    ] # end array
  end # class method status

  ### Relations ###
  belongs_to :user

  ### Validation ###
  validates :user,   :presence => true
  validates :name,   :presence => true, :uniqueness => { :scope => :user }
  validates :status, :presence => true, :inclusion => {
    :in => Mission.status,
    :message => "must be #{Mission.status[0...-1].join(', ')}, or #{Mission.status[-1]}"
  } # end validates

  ########################
  ### Instance Methods ###
  ########################

  Mission.status.each do |status|
    define_method "#{status.gsub /\s/,'_'}?" do
      self.status == status
    end # method
  end # each
end # model
