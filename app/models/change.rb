class Change < ActiveRecord::Base


	belongs_to :user
  belongs_to :state
	has_many :votes, :dependent => :destroy

  has_many :categorizations, :dependent => :destroy
  has_many :categories, through: :categorizations

  accepts_nested_attributes_for :categories

	mount_uploader :picture, PictureUploader

  # validates_inclusion_of :format, in: %w( jpg gif png ), message: "extension %{value} is not included in the list"
  # validates_length_of :username, minimum: 3, too_short: 'please enter at least 3 characters'

	def trending_algorithm(gravity = 1.8)
		# For a given change
    # Find all votes
    # Points is the difference of upvotes and downvotes
    # Time is the difference between now and when the crush was created (in hours)
    # We fix gravity, but can override if necessary  
    points = self.aggregate
    time = ((Time.now - self.created_at) / 5760).round
    rank = (points - 1).to_f / ((time + 2)**gravity)

	end

  def up_votes
    votes.select{|vote| vote.upvote }
  end

  def down_votes
    votes.reject{|vote| vote.upvote }
  end

  def aggregate
    self.up_votes.size - self.down_votes.size
  end


end