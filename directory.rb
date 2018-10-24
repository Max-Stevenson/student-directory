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
	puts "3. Save students to CSV."
	puts "4. Load students from CSV."
	puts "5. Delete a student."
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
	when "3"
		save_students
	when "4"
		load_students_CSV
	when "5"
		delete_student
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
		process(STDIN.gets.chomp)
	end
end

# Refactor method - add data to @students global array
def push_to_array (student_data)
	@students << {name: student_data, cohort: :november}
	@students.uniq!
end

# Method for user to input custom list of students
def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# get the first name
	name = STDIN.gets.chomp
	while !name.empty? do
		push_to_array (name)
		puts "Now we have #{@students.count} students"
		name = STDIN.gets.chomp
	end
end

# Method to load students utilising CSV library
def load_students_CSV
	require 'csv'
	puts "Please enter file to load students from - please include file extension"
	usr_choice = gets.chomp
	CSV.foreach(usr_choice) do |row|
		push_to_array(row[0])
	end
	puts "#{usr_choice} loaded succesffuly"
end

def load_students (filename = "students.csv")
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort = line.chomp.split(',')
		push_to_array (name)
	end
	file.close
	puts "#{filename} loaded succesffuly"
end

# Header method to print beginner header
def print_header
	puts "The students of Villians Academy"
	puts "-------------"
end

# Method to print each name contained in students hash
def print_students_list
	@students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
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

def save_students
	puts "What file would you like to save to?"
	usr_file = gets.chomp
	# open file for processing
	file = File.open(usr_file, "w")
	# iterate over student array
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
		file.close
	puts "#{usr_file} saved succesffuly"
end

def CSV_save_students
	puts "What file would you like to save to?"
	usr_file = gets.chomp
end


def try_load_students (file = "students.csv")
	filename = ARGV.first
	if filename.nil?
		load_students(file)
		puts "Loaded #{@students.count} from #{file}"
	elsif File.exists?(filename)
		load_students(filename)
		puts "Loaded #{@students.count} from #{filename}"
	else
		puts "Sorry, #{filename} doesn't exist."
		exit
	end
end

# Method to delete students from the global students array
def delete_student
	puts "Please enter the name of the student you wish to delete"
	usr_choice = gets.chomp.capitalize
	if @students.delete_if {|x| x[:name].include?(usr_choice)}
		puts "#{usr_choice} was deleted succesffuly"
	else
		puts "Error #{usr_choice} does not exist!"
	end
end

try_load_students
interactive_menu