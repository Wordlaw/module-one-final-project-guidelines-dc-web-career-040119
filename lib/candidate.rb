class Candidate < ActiveRecord::Base
  has_many :employercandidates
  has_many :employers, through: :employercandidates



  def self.select_array_on_experience(company_choice_index, job_choice_index)
    candidate_experience = Employer.all[company_choice_index].jobs[job_choice_index][:experience_requirement]
    eligible_candidate_arr = self.all.select do |candidate|
      if candidate_experience <= candidate[:candidate_experience]
        candidate
      end
    end
    eligible_candidate_arr
  end

  def self.list_candidates(eligible_candidate_arr)
    puts " "
    puts "These are you candidates based on eligible years of experience"
    eligible_candidate_arr.collect.with_index(1) do |candidate, i|
      puts "#{i}. #{candidate[:name]}"
    end
    puts
  end

  def self.select_candidate(eligible_candidate_arr, company_choice_index, job_choice_index)
    candidate_list_size = eligible_candidate_arr.size
    input = 0
    while input < 1 || input > candidate_list_size
      input = gets.chomp.to_i
      if input < 1 || input > candidate_list_size
        puts "Invalid Input. Please choose one of the provided options."
      end
    end
    candidate_choice_index = input - 1
    candidate_choice_index
  end

    def self.display_choice(eligible_candidate_arr, candidate_choice_index, job_salary)

    puts " "
    puts "You chose, #{eligible_candidate_arr[candidate_choice_index][:name]}"
    if eligible_candidate_arr[candidate_choice_index][:salary_expectations] < job_salary
      puts " "
      puts "Congratulations!!! You hired #{eligible_candidate_arr[candidate_choice_index][:name]}"
    else
      puts " "
      puts "We're sorry #{eligible_candidate_arr[candidate_choice_index][:name]}'s salary expectations exceed the job requistion "
    end


    #select candidate
    #if more than one candidate ask to slect by random or Choose
    #if candidate expect salary is higher puts out candidate will not work
    #if candidate expect salary is lower, puts out hired
  end


end #End of class
