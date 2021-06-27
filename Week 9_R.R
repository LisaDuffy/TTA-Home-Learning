# Task 1 
a <- 1:5
b <- 6:10
c <- 11:15

my_vec <- data.frame(a,b,c)
my_vec
matplot(my_vec, type ="b", pch=15, col=1:3)

matplot(my_vec, type ="b", pch=5, ylab="")

title(xlab= "Position in Vector", ylab = "Vector Numbers", main = "Vector Matrix", col.main="Red")

# Task 2
Employee_Names <- c('John Birch', 'Mary Lowe', 'Craig Evans', 'Tess Smith', 'Terry Nixen')
Employee_Ages <- c(42,26,32,51,28)
Employee_Role <- c('Manager', 'Assitant','Assistant','Director','Manager')
Employee_Service <- c(10,5,2,23,7)

Employees <- data.frame(Employee_Names,Employee_Ages,Employee_Role,Employee_Service)

Employees

# Task 3
library(ggplot2)

x_data <- 1:20
x_data
y_data <- x_data ^ 2
y_data

qplot(x = x_data, y = y_data, geom = "smooth", main = "TTA Home Learning Task 3", xlab = "Sequence Numbers", ylab = "Power of 2") 


# Task 4
percentage <- c(45, 62, 36, 89, 51)
subjects <- c("History", "Maths", "Science", "Maths", "English")

barplot(percentage, main = "Number of pupils taking Subjects", xlab = "Percentage",
        ylab = "", names.arg = subjects, xlim = c(0, 100), col = "red", horiz = TRUE)

# Task 5
name <- readline("What is your name? ")
age <- readline("What is your age? ")
message <- paste ("Hello", name, ", you are", age, "years old.")
message

# Task 6
sequence <- 20:50
print ("Sequence of numbers from 20 to 50:")
sequence
print ("Mean of this sequence: ")
mean(sequence)
print ("Sum of this sequence: ")
sum(sequence)

# Task 7
my_vec = sample(-50:50, 10, replace=TRUE)
print("10 random integer values between -50 and +50:")
my_vec

# Task 8
# create vector of 10 places to hold Fibonacci numbers
Fibonacci <- numeric(10)
# fill in first and second Fibonacci numbers
Fibonacci[1] <- Fibonacci[2] <- 1
# calculate next 8 Fibonacci numbers by adding previous 2
for (i in 3:10) Fibonacci[i] <- Fibonacci[i - 2] + Fibonacci[i - 1]
print("First 10 Fibonacci numbers:")
Fibonacci

# Task 9
numbers <- 1:100
fizz_buzz <- character(100)
for (i in 1:100) 
  {
  if (numbers[i] %% 3 == 0 )
    fizz_buzz[i] <- 'Fizz'
  }
for (i in 1:100) 
{
  if (numbers[i] %% 5 == 0 )
    fizz_buzz[i] <- 'Buzz'
}
for (i in 1:100) 
{
  if (numbers[i] %% 3 == 0 & numbers[i] %% 5 == 0 )
    fizz_buzz[i] <- 'FizzBuzz'
}
for (i in 1:100)
{
  msg <- c(numbers[i], fizz_buzz[i])
  print(msg)
}
