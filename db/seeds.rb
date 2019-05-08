require 'pry'

Candidate.destroy_all
Employer.destroy_all
Job.destroy_all
Employercandidate.destroy_all

#EMPLOYER **********************************************************************
employer_objects = [
google = Employer.create(name: "Google", location: "San Francisco"),
facebook = Employer.create(name: "Facebook", location: "Austin Texas"),
microsoft = Employer.create(name: "Microsoft", location: "Seattle"),
apple = Employer.create(name: "Apple", location: "Austin Texas"),
flatiron = Employer.create(name: "Flat Iron School", location: "New York City"),
spacex = Employer.create(name: "Space X", location: "Los Angeles")]

# [google, facebook, microsoft, apple, flatiron, spacex ]


#CANDIDATES ********************************************************************
candidate_arr = ["marcus", "terrell", "anita", "jc", "bruno", "paul", "mike", "sati", "gabby", "loosi", "zarwan", "samra", "amber", "nicole", "raheel", "justin", "beyonce", "jayz", "nas", "emel", "leah"]


def random_exp
  exp = rand(1..15)
end

def random_salary(random_exp)
  if random_exp < 3
    salary = rand(50000..70000)
  elsif random_exp >= 3 && random_exp < 6
    salary = rand(70000..90000)
  elsif random_exp >= 6 && random_exp <= 10
    salary = rand(90000..130000)
  elsif random_exp > 10
    salary = rand(120000..160000)
  end
  salary
end

def random_candidate(candidate_arr, employer_objects)
  candidate_arr.collect do |candidate|
    number = random_exp
    candidate = Candidate.create(name: candidate.capitalize, candidate_experience: number, salary_expectations: random_salary(number))
    3.times do |join|
      emp_id = employer_objects.sample.id
      Employercandidate.create(employer_id: emp_id , candidate_id: candidate.id)
    end
  end
end


#JOBS***************************************************************************

job_arr = ["UX Designer", "Scrum Master", "Software Engineer" , "Software Engineer II", "Software Engineer III", "Tech Fellow","Software Engineer IV", "Software Engineer V", "Manager", "Program Manager", "Director",
"UX Designer", "Scrum Master", "Software Engineer" , "Software Engineer II", "Software Engineer III", "Tech Fellow","Software Engineer IV", "Software Engineer V", "Manager",
"UX Designer", "Scrum Master", "Software Engineer" , "Software Engineer II", "Software Engineer III", "Tech Fellow","Software Engineer IV", "Software Engineer V", "Manager",
"UX Designer", "Scrum Master", "Software Engineer" , "Software Engineer II", "Software Engineer III", "Tech Fellow","Software Engineer IV", "Software Engineer V", "Manager"]

def random_salary_job(job_arr)
  if job_arr == "UX Designer" || job_arr == "Scrum Master" || job_arr == "Software Engineer"
    salary = rand(50000..70000)
  elsif job_arr == "Software Engineer II" || job_arr == "Software Engineer II" || job_arr == "Software Engineer III"
    salary = rand(70000..90000)
  elsif job_arr == "Tech Fellow" || job_arr == "Software Engineer IV" || job_arr == "Software Engineer V"
    salary = rand(90000..120000)
  else
    salary = rand(121000..160000)
  end
  salary
end

def random_experience_job(job_arr)
  if job_arr == "UX Designer" || job_arr == "Scrum Master" || job_arr == "Software Engineer"
    exp = rand(0..3)
  elsif job_arr == "Software Engineer II" || job_arr == "Software Engineer III" || job_arr == "Tech Fellow"
    exp = rand(3..8)
  elsif job_arr == "Software Engineer IV" || job_arr == "Software Engineer V"
    exp = rand(7..12)
  else
    exp = rand(10..20)
  end
  exp
end


def random_job(job_arr, employer_objects)
  job_arr.collect do |job|
    job_name = job
    job_object = job
    job_object = Job.create(name: job_name.capitalize, experience_requirement: random_experience_job(job_name), salary: random_salary_job(job_name), employer_id: employer_objects.sample.id )
  end
end

random_candidate(candidate_arr, employer_objects)
random_job(job_arr, employer_objects)

#, employer_id: employer_objects.shuffle.id

#Employers


#JOIN






#Employer Candidates Join


#Jobs
