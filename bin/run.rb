require_relative '../config/environment'

# Recruiter.header
# puts " "
# puts " "
# puts " "
# puts " "
# puts "             Lets get started, tell us your name "
# puts " "
# puts " "
# name = gets.chomp
# puts " "
# puts "Hi #{name}, welcome to our recruitment tool"

  Employer.list_employers
  puts "What company do you represent? (1-6)"
  company_choice_index = Employer.select_employer
  eligible_candidate_arr = []
  while eligible_candidate_arr.empty?
    Employer.list_job(company_choice_index)
    job_choice_index = Employer.select_job(company_choice_index)
    puts " "
    puts "Sorry there are no candidates eligible for this job consider changing job salary"
    puts " "
    Employer.display_job(company_choice_index, job_choice_index)
    eligible_candidate_arr = Candidate.select_array_on_experience(company_choice_index, job_choice_index)
  end
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




#if you dont type employer should return to program
