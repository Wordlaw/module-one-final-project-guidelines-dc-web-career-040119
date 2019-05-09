require_relative '../config/environment'


puts " "
puts " "
puts " "
puts " "
puts "             Lets get started, tell us your name "
puts " "
puts " "
name = gets.chomp
puts " "

  Employer.list_employers
  puts "What company do you represent? (1-6)"
  company_choice_index = Employer.select_employer
  eligible_candidate_arr = []
  while eligible_candidate_arr.empty?
    Employer.list_job(company_choice_index)
    job_choice_index = Employer.select_job(company_choice_index)
    puts " "
    puts "Sorry there are no candidates eligible for this job"
    puts " "
    Employer.display_job(company_choice_index, job_choice_index)
    eligible_candidate_arr = Candidate.select_requirements(company_choice_index, job_choice_index)
  end
  Candidate.list_candidates(eligible_candidate_arr)
  Candidate.select_candidate(eligible_candidate_arr, company_choice_index, job_choice_index)



#if you dont type employer should return to program
