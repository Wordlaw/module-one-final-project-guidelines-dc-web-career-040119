

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



end
