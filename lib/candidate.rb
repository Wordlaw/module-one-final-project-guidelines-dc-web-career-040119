class Candidate < ActiveRecord::Base
  has_many :employercandidates
  has_many :employers, through: :employercandidates






end #End of class
