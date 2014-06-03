class User < ActiveRecord::Base
	has_many :changes
	has_many :votes #, through: :changes
  belongs_to :state
	validates :username, presence: true
	validates :username, uniqueness: true
  validates :state_id, presence: true
	validates_confirmation_of :password

  # accepts_nested_attributes_for :state, reject_if: :new_record?
	has_secure_password





  def vote_for(change_id, value)
  	@vote = self.votes.where(change_id: change_id).first || self.votes.build(change_id: change_id)

	  if @vote.value.to_s == value
      @k = 0
    else
      @vote.value = value
      @vote.save!
      @k = value.to_i
    end 
    @k
  end

end