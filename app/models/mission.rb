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
      'in_progress',
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

  def status_message
    status.titleize
  end # method status_message

  ### Serialization ###

  def as_json options = {}
    # Include nested models:
    #   :include => %i(comments)
    super options.merge(:only => %i(id name status), :methods => :status_message)
  end # method as_json
end # model
