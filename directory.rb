# Student names into an array
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]

# Header method to print beginner header
def print_header
	puts "The students of Villians Academy"
	puts "-------------"
end

# Method to print each name contained in students array
def print_students student_arr
	student_arr.each do |x|
		puts x
	end
end

# Footer method using string interpolation to print total number of students contained in students array
def print_footer student_arr
	puts "Overall, we have #{student_arr.count} great students"
end

print_header
print_students (students)
print_footer (students)