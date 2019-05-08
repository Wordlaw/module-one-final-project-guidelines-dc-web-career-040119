class Jobs < ActiveRecord::Migration[5.0]
  def change
    create_table(:jobs) do |t|
      t.string :name #Name of experience
      t.integer :experience_requirement #Years of experience
      t.integer :salary #Salary of job
      t.integer :employer_id
    end
  end
end
