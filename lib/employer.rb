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
    if company_choice_index < 6 && company_choice_index > -1
      puts " "
      puts "You chose #{self.all[company_choice_index][:name]}".yellow
    else
      puts "Invalid input, choose a number from one to 6".red
      self.select_employer
    end
    return company_choice_index
  end

  def self.list_job(company_choice_index)
    puts " "
    puts "what job are you hiring for? ".yellow
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
        puts "Invalid Input. Please choose one of the provided options.".red
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

  def self.change_experience(company_choice_index, job_choice_index)
    job_object = self.all[company_choice_index].jobs[job_choice_index]
    puts "The experience requirement for this job is currently #{job_object[:experience_requirement]} years"
    puts " "
    puts "What would you like the new Experience Requirement to be"
    new_experience = gets.chomp
    job_object.update(experience_requirement: new_experience.to_i)
    puts " "
    puts "This is the new Experience Requirement #{job_object[:experience_requirement]}"

  end

  def self.change_salary(company_choice_index, job_choice_index)
    puts " "
    puts "Sorry there are no candidates eligible for this job consider changing the salary".red
    puts " "
    puts "Would you like to change the salary for this job yes or no?".yellow
    chge_salary = gets.chomp
    if chge_salary.start_with?("y")
      eligible_candidate_arr = Candidate.select_array_on_experience(company_choice_index, job_choice_index)
      return eligible_candidate_arr
    else
      job_object = self.all[company_choice_index].jobs[job_choice_index]
      puts "The salary for this job is currently $#{job_object[:salary]}"
      puts " "
      puts "What would you like the new salary to be"
      new_salary = gets.chomp
      job_object.update(salary: new_salary.to_i)
      puts " "
      puts "This is the new salary #{job_object[:salary]}"
    end

  end



end #End of Class
