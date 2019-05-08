class Employercandidates < ActiveRecord::Migration[5.0]
  def change
    create_table(:employercandidates) do |t|
      t.integer :employer_id #Employer id
      t.integer :candidate_id #Candidate id
    end
  end
end
