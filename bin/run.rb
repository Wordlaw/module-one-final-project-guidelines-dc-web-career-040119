require 'colorize'
require_relative '../config/environment'
puts "\e[H\e[2J"
Recruiter.header
puts " "
puts " "
puts " "
puts " "
puts "             Lets get started, tell us your name ".yellow
puts " "
puts " "
name = gets.chomp
puts " "
puts "\e[H\e[2J"
puts "Hi #{name}, welcome to our recruitment tool".yellow

  Employer.list_employers
  puts "What company do you represent? (1-6)".yellow
  company_choice_index = Employer.select_employer
  #puts "\e[H\e[2J"
  eligible_candidate_arr = []
  while eligible_candidate_arr.empty?
    Employer.list_job(company_choice_index)
    job_choice_index = Employer.select_job(company_choice_index)
    Employer.display_job(company_choice_index, job_choice_index)
    eligible_candidate_arr = Candidate.select_array_on_experience(company_choice_index, job_choice_index)
    if eligible_candidate_arr.size === 0
      puts " "
      puts "Sorry there are no candidates eligible for this job consider changing the experience requirement".yellow
      puts " "
      puts "Would you like to change the experience_requirement for this job yes or no?".yellow
      chge_experience = gets.chomp
      if chge_experience.start_with?("y")
        Employer.change_experience(company_choice_index, job_choice_index)
      end
      puts " "
    end
    puts "\e[H\e[2J"
  end

  candidate_choice_index1 = 0
  job_salary1 = Employer.all[company_choice_index].jobs[job_choice_index][:salary]
  candidate_salary1 = eligible_candidate_arr[candidate_choice_index1][:salary_expectations]
  while eligible_candidate_arr.size === 1 && (candidate_salary1 > job_salary1)
    Candidate.list_candidates(eligible_candidate_arr)
    candidate_choice_index = Candidate.select_candidate(eligible_candidate_arr, company_choice_index, job_choice_index)
    puts "\e[H\e[2J"
    job_salary = Employer.all[company_choice_index].jobs[job_choice_index][:salary]

    puts " "
    puts "Sorry there are no candidates eligible for this job consider changing the salary".yellow
    puts " "
    puts "Would you like to change the salary for this job yes or no?".yellow
    chge_salary = gets.chomp
    if chge_salary.start_with?("y")
      Employer.change_salary(company_choice_index, job_choice_index)
    end
    eligible_candidate_arr = Candidate.select_array_on_experience(company_choice_index, job_choice_index)
  end

  puts " "
  Candidate.list_candidates(eligible_candidate_arr)

  candidate_choice_index = Candidate.select_candidate(eligible_candidate_arr, company_choice_index, job_choice_index)
  job_salary = Employer.all[company_choice_index].jobs[job_choice_index][:salary]
  candidate_salary = eligible_candidate_arr[candidate_choice_index][:salary_expectations]
  while candidate_salary > job_salary

    Candidate.display_choice(eligible_candidate_arr, candidate_choice_index, job_salary)
    #puts "We're sorry #{eligible_candidate_arr[candidate_choice_index][:name]}'s salary expectations exceed the job requistion "
    Candidate.list_candidates(eligible_candidate_arr)
    candidate_choice_index = Candidate.select_candidate(eligible_candidate_arr, company_choice_index, job_choice_index)
    Candidate.display_choice(eligible_candidate_arr, candidate_choice_index, job_salary)
    candidate_salary = eligible_candidate_arr[candidate_choice_index][:salary_expectations]
  end
  #Candidate.display_choice(eligible_candidate_arr, candidate_choice_index, job_salary)




#if you dont type employer should return to program
