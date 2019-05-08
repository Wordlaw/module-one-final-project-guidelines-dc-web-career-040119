class Employers < ActiveRecord::Migration[5.0]
  def change
    create_table(:employers) do |t|
      t.string :name #Name of experience
      t.string :location #Location of employer
    end
  end
end
