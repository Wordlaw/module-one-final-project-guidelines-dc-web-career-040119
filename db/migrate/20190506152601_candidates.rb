class Candidates < ActiveRecord::Migration[5.0]
  def change
    create_table(:candidates) do |t|
      t.string :name #Name of experience
      t.integer :candidate_experience #Years of experience
      t.integer :salary_expectations #Salary requirement
    end
  end
end
