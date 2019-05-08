class Employer < ActiveRecord::Base
  has_many :jobs
  has_many :employercandidates
  has_many :candidates, through: :employercandidates


  def self.list_employers
    puts " "
    self.all.collect.with_index(1) do |jobs, i|
      puts "#{i}. #{jobs.name}"
    end
    puts " "
  end



  def self.select_employer
    puts " "
    company_input = gets.chomp
    company_choice_index = company_input.to_i - 1
    if company_choice_index <= 6
      puts " "
      puts "You chose #{self.all[company_choice_index][:name]}"
    else
      puts "Invalid input, choose a number from one to 6"
      self.select_employer
    end
    return company_choice_index
  end

  def self.list_job(company_choice_index)
    puts " "
    puts "what job are you hiring for? "
    puts " "
    self.all[company_choice_index].jobs.collect.with_index(1) do |jobs, i|
      puts "#{i}. #{jobs.name}"
    end
    puts " "
  end

  def self.select_job(company_choice_index)
    job_list_size = self.all[company_choice_index].jobs.size
    input = 0
    while input < 1 || input > job_list_size
      input = gets.chomp.to_i
      if input < 1 || input > job_list_size
        puts "Invalid Input. Please choose one of the provided options."
      end
    end
    job_choice_index = input - 1
    puts " "
    return job_choice_index
  end

  def self.display_job(company_choice_index, job_choice_index)
    puts "Company: #{self.all[company_choice_index][:name]}"
    puts "Job: #{self.all[company_choice_index].jobs[job_choice_index][:name]}"
    puts "Experience Requirement: #{self.all[company_choice_index].jobs[job_choice_index][:experience_requirement]}"
    puts "Starting Salary: #{self.all[company_choice_index].jobs[job_choice_index][:salary]}"
  end



end #End of Class
