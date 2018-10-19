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
{name: "The Joker", cohort: :november, hobbies: "General anarchy", country_of_birth: :USA},
{name: "Joffrey Baratheon", cohort: :november, hobbies: "Sadistic torture", country_of_birth: :Westeros},
{name: "Norman Bates", cohort: :november, hobbies: "80's jazz pop", country_of_birth: :USA}
]

@students = []

# Refactor - seperate method to print menu options
def print_menu
	puts "1. Input new students."
	puts "2. Show students."
	puts "9. Exit program."
end

# Refactor - seperate method to print students
def show_students
	print_header
	print_students_list
	print_footer
end

# Refactor - seperate method to process user selection
def process (selection)
	case selection
	when "1"
		input_students
	when "2"
		show_students
	when "9"
		exit
	else
		puts "Error invalid selection - please try again"
	end
end

# Refactor - interactive menu utilising methods

def interactive_menu
	loop do
		print_menu
		process(gets.chomp)
	end
end


# Method for user to input custom list of students
def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# get the first name
	name = gets.chomp
	while !name.empty? do
		@students << {name: name, cohort: :november}
		puts "Now we have #{@students.count} students"
		name = gets.chomp
	end
end

# Header method to print beginner header
def print_header
	puts "The students of Villians Academy"
	puts "-------------"
end

# Method to print each name contained in students hash
def print_students_list
	@students.each do |student|
		puts "#{@students[:name]} (#{@students[:cohort]} cohort)"
	end
end

# Footer method using string interpolation to print total number of students contained in students hash
def print_footer
	student_var = ""
	if @students.length == 1
		student_var = "student"
	else
		student_var = "students"
	end
	puts "Overall, we have #{@students.count} great #{student_var}"
end



interactive_menu