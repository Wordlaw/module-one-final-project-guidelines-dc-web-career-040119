class Recruiter


  def self.header
    puts <<-'EOF'
            _____                      _ _
           |  __ \                    (_) |
           | |__) |___  ___ _ __ _   _ _| |_ ___ _ __
           |  _  // _ \/ __| '__| | | | | __/ _ \ '__|
           | | \ \  __/ (__| |  | |_| | | |_  __/ |
           |_|  \_\___|\___|_|   \__,_|_|\__\___|_|

      EOF
      puts " "
      puts "            !!Welcome to Our Recrutiment Portal!! "
      puts " "
      self.list_employers
    end

    def new_methods
      puts " "
      puts "What would you like to do next?"
      puts "1. Hire another candidate"
      puts "2. See company data"
      puts "3. change salary for a job"
      puts "4. See list of hired candidates"
      puts " "
    end

    def choose_new_method
      type_another_choice = gets.chomp
      case type_another_choice.to_i
      when 1
        puts "HIRE"
      when 2
        puts "DATA"
      when 3
        puts "SALARY"
      when 4
        puts "HIRED"
      else
        puts "Goodbye #{name}"
        return
      end
    end

  def self.list_employers
    puts " "
    Employer.all.collect.with_index(1) do |jobs, i|
      puts "#{i}. #{jobs.name}"
    end
    puts " "
    self.select_employer
  end

  def self.select_employer
    puts " "
    company_input = gets.chomp
    company_choice_index = company_input.to_i
    if company_choice_index <= 6 && company_choice_index >= 1
      puts " "
      puts "You chose #{Employer.all[company_choice_index - 1][:name]}"
    else
      puts " input, choose a number from one to 6"
      self.select_employer
    end
    company_choice_index = company_choice_index - 1
    self.list_job(company_choice_index)
  end

  def self.list_job(company_choice_index)
    puts " "
    puts "what job are you hiring for? "
    puts " "
    Employer.all[company_choice_index].jobs.collect.with_index(1) do |jobs, i|
      puts "#{i}. #{jobs.name}"
    end
    puts " "
    self.select_job(company_choice_index)
  end

  def self.select_job(company_choice_index)
    job_list_size = Employer.all[company_choice_index].jobs.size
    input = 0
    while input < 1 || input > job_list_size
      input = gets.chomp.to_i
      if input < 1 || input > job_list_size
        puts "Invalid Input. Please choose a number from one to #{job_list_size}"
      end
    end
    job_choice_index = input - 1
    puts " "
    self.display_job(company_choice_index, job_choice_index)
  end

  def self.display_job(company_choice_index, job_choice_index)
    puts "Company: #{Employer.all[company_choice_index][:name]}"
    puts "Job: #{Employer.all[company_choice_index].jobs[job_choice_index][:name]}"
    puts "Experience Requirement: #{Employer.all[company_choice_index].jobs[job_choice_index][:experience_requirement]}"
    puts "Starting Salary: #{Employer.all[company_choice_index].jobs[job_choice_index][:salary]}"
    self.select_requirements(company_choice_index, job_choice_index)
  end

  def self.select_requirements(company_choice_index, job_choice_index)
    puts "WE ARE AT SELECT REQ 0-0"
    candidate_experience = Employer.all[company_choice_index].jobs[job_choice_index][:experience_requirement]
    eligible_candidate_arr = Candidate.all.select do |candidate|
      if candidate_experience <= candidate[:candidate_experience]
        candidate
      end
    end
    self.list_candidates(eligible_candidate_arr, company_choice_index, job_choice_index)
  end

  def self.list_candidates(eligible_candidate_arr, company_choice_index, job_choice_index)
    puts "WE ARE AT LIST CANDIDATE 0-1"
    puts " "
    # Include if statement to check if elig_arr.size ==0
    if eligible_candidate_arr.size == 0
      puts " "
      puts "Were sorry there are no candidates for this job, consider changing your salary"
      #ADD OPTION TO CHANGE SALRY


      self.list_job(company_choice_index)
    else
      eligible_candidate_arr.collect.with_index(1) do |candidate, i|
        puts "#{i}. #{candidate[:name]}"
      end
    end

    self.select_candidate(eligible_candidate_arr, company_choice_index, job_choice_index)
  end

  def self.select_candidate(eligible_candidate_arr, company_choice_index, job_choice_index)
    puts "WE ARE AT SELECT CANDIDATE 0-2"
    job_salary = Employer.all[company_choice_index].jobs[job_choice_index][:salary]
    candidate_list_size = eligible_candidate_arr.size
    input = 0

    puts "WERE AT STEP 2 and input is #{input}"
    while input < 1 || input > candidate_list_size
      puts "WERE AT STEP 3 and input is #{input}"
      input = gets.chomp.to_i
        puts "Invalid Input. Please choose one of the provided options."
        puts "Input is #{input} and clz is #{candidate_list_size}"
    end
    candidate_choice_index = input - 1
    puts " "
    puts "You chose, #{eligible_candidate_arr[input-1][:name]}"
    if eligible_candidate_arr[input-1][:salary_expectations] < job_salary
      puts " "
      puts "Congratulations!!! You hired #{eligible_candidate_arr[input-1][:name]}"
      puts "WERE AT STEP 1 and input is #{input}"
      return

    else
      puts " "
      puts "We're sorry #{eligible_candidate_arr[candidate_choice_index][:name]}'s salary expectations exceed the job requistion "
      self.list_candidates(eligible_candidate_arr, company_choice_index, job_choice_index)
      puts "WERE AT STEP 1-1"
    end

    #select candidate
    #if more than one candidate ask to slect by random or Choose
    #if candidate expect salary is higher puts out candidate will not work
    #if candidate expect salary is lower, puts out hired
  end





end
