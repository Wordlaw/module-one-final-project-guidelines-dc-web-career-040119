class Employercandidate < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :employer
end
