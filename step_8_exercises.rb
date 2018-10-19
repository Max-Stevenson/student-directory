# Student names into an array
students = [
{name: "Dr. Hannibal Lecter", cohort: :november, hobbies: "Eating people", country_of_birth: :USA},
{name: "Darth Vader", cohort: :november, hobbies: "Using the force", country_of_birth: :Tatooine},
{name: "Nurse Ratched", cohort: :november, hobbies: "Abuse of power", country_of_birth: :USA},
{name: "Michael Corleone", cohort: :november, hobbies: "Racketeering, protection", country_of_birth: :USA},
{name: "Alex DeLarge", cohort: :november, hobbies: "Ultraviolence", country_of_birth: :UK},
{name: "The Wicked Witch of the West", cohort: :november, hobbies: "Witchcraft", country_of_birth: :Oz},
{name: "Terminator", cohort: :november, hobbies: "Looking for Sarah Connor", country_of_birth: :NA},
{name: "Freddy Krueger", cohort: :november, hobbies: "Dream stalking", country_of_birth: :USA},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]

# Method for user to input custom list of students
def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# create an empty array
	students = []
	# get the first name
	name = gets.chomp
	while !name.empty? do
		students << {name: name, cohort: :november}
		puts "Now we have #{students.count} students"
		name = gets.chomp
	end
	# return array of students
	students
end

# Header method to print beginner header
def print_header
	puts "The students of Villians Academy"
	puts "-------------"
end

# Method to print each name contained in students hash
def print_students student_arr
	student_arr.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

# Footer method using string interpolation to print total number of students contained in students hash
def print_footer student_arr
	student_var = ""
	if student_arr.length == 1
		student_var = "student"
	else
		student_var = "students"
	end
	puts "Overall, we have #{student_arr.count} great #{student_var}"
end

# Exercise 1: print index before each student's name
def print_students_idx student_arr
	student_arr.each_with_index do |student, index|
		puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)"
	end
end

# Exercise 2: only print students whose name begins with a specific letter
def print_specific_lttr student_arr
	puts "Please enter a letter to display all students whose name begins with that letter"
	choice = gets.chomp.upcase
	student_arr.each do |student|
		if student[:name].chars.first == choice
			puts "#{student[:name]} (#{student[:cohort]} cohort)"
		end
	end
end

# Exercise 3: only print students with a name under 12 characters long
def print_under_12 student_arr
	puts "The following students have a name under 12 characters long"
	student_arr.each do |student|
		if student[:name].length < 12
			puts "#{student[:name]} (#{student[:cohort]} cohort)"
		end
	end
end

# Exercise 4: Rewrite each() method - use a while or until to print students
def print_contrived_while student_arr
	i = 0
	while i < student_arr.length
		puts student_arr[i][:name] + " " + "(" + student_arr[i][:cohort].to_s + ")"
		i += 1
	end
end

# Exercise 5: Add more information for each student, hobbies, country of birth, height, etc.
# Modified initial student array.

# Exercise 6: Research the center() method for Strings
def print_students_centered student_arr
	student_arr.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
	end
end

# Exercise 7: Revamp input_students method - cohort, empty values, default values, convert to symbol, spell check
def input_students_improved
	require 'date'
	students = []
	running = true
	while running
		puts "New student record creation..."
		puts "Please enter student name"
		name = gets.chomp.capitalize
		while name.empty?
			puts "Error: the name must not be blank"
			name = gets.chomp.capitalize
		end
		puts "Please enter cohort month"
		month = gets.chomp.capitalize.to_sym
		if month.empty?
			month = Date.today.strftime("%B").to_sym
		end
    while !month_checker month
      month = gets.chomp.capitalize.to_sym
		end
		students << {name: name, cohort: month}
		puts "Now we have #{students.count} students"
		puts "Would you like to enter another student? - y/n"
		choice = gets.chomp
		choice == 'y' ? running = true : running = false
	end
	students
end

def month_checker month
	months = [
	:January,
	:February,
	:March,
	:April,
	:May,
	:June,
	:July,
	:August,
	:September,
	:October,
	:November,
	:December
	]
	if months.include?(month)
		return true
	else
		puts "Error: month not recognized - Did you mean: "
		months.each do |mnth|
			if month.to_s[0] == mnth.to_s[0]
				print "#{mnth} "
			end
		end
    puts " "
    return false
	end
end

# Exercise 8: Print students by cohort
def print_students_by_cohort student_arr
  sorted_by_input = {}
  student_arr.each do |x|
    selection = x[:cohort].upcase
    if sorted_by_input[selection] == nil
      sorted_by_input[selection] = []
    end
    sorted_by_input[selection].push(x[:name])
  end
  puts sorted_by_input.flatten
end

# Exercise 9: Fix footer to display correct grammar
# Original footer modified with if else branch

# Exercise 10: Alternative to chomp() method
def chomp_alt
	puts "Please enter some text to see various alternatives to the chomp() method"
	choice = gets.chop
	puts choice
	choice = gets.strip
end

# Exercise 11: 
# Error checking sample file

