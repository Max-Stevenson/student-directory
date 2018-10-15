# Student names into an array
students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]

# Header method to print beginner header
def print_header
	puts "The students of Villians Academy"
	puts "-------------"
end

# Method to print each name contained in students hash
def print_students student_hash
	student_hash.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

# Footer method using string interpolation to print total number of students contained in students hash
def print_footer student_arr
	puts "Overall, we have #{student_arr.count} great students"
end

print_header
print_students (students)
print_footer (students)