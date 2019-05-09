class Employer < ActiveRecord::Base
  has_many :jobs
  has_many :employercandidates
  has_many :candidates, through: :employercandidates


  


end #End of Class
