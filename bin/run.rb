require_relative '../config/environment'

puts " "
puts " "
puts " "
puts " "
puts "            !!Welcome to Our Recrutiment Portal!! "
puts " "
puts " "
puts " "
puts " "
puts "             Lets get started, tell us your name "
puts " "
puts " "
name = gets.chomp
puts " "
puts " "
puts "Hi #{name}, are you an employer or a job seeker?"
puts " "
puts " "
type_choice = gets.chomp
if type_choice.start_with?("E") || type_choice.start_with?("e")
  Employer.list_employers
  puts "What company do you represent?"
  company_choice_index = Employer.select_employer
  Employer.list_job(company_choice_index)
  job_choice_index = Employer.select_job(company_choice_index)
  Employer.display_job(company_choice_index, job_choice_index)
  eligible_candidate_arr = Candidate.select_requirements(company_choice_index, job_choice_index)
  Candidate.list_candidates(eligible_candidate_arr)
  Candidate.select_candidate(eligible_candidate_arr, company_choice_index, job_choice_index)
  puts " "
  puts "What would you like to do next?"
  puts "1. Hire another candidate"
  puts "2. See company data"
  puts "3. change salary for a job"
  puts "4. See list of hired candidates"
  puts " "
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


  #Choose company you represent
  #select which job you are hiring for
  #


elsif type_choice.start_with?("J") || type_choice.start_with?("j")
  puts "Now you are unemployed"
else
  puts "I didnt understand your input, type employer or job seeker"
end


#if you dont type employer should return to program
