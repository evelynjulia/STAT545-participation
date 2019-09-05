# Eve's examples from class meeting 2
# 5 Sep 2019
# R exploration

x <- 5+2
??ggplot

print(x)

# need to remember order of variables: if I add a line at the top using a variable
# and I've already run the srcipt to define it it won't give me an error because
# the variable is still in the environment
# So make sure not to do that! (it's like Jupyter)

(times <- c(60, 40, 33, 15, 20, 55, 35)) # putting brackets around here auto prints it

times/60

mean(times)
sqrt(times)
range(times)


times < 30
times == 20
times != 20

times > 20 & times <50
times < 20 | times > 50

which(times < 30) # find indices of times less than 30 minutes
# can also use any() and all()

sum(times < 20 | times > 50)


# subsetting
times[3]
times[c(2,4)]
times[1:5]

tail(times, n=1) # finds the end value of times
times[length(times)] # finds the end value of times
times[end(times)[1]]
  
times[times > 50] <- 50
times

# working with missing values

times[length(times)+1] <- NA

mean(times, na.rm = T)

mean(times[1:end(times)[1]-1])

# these do different things
??mean
?mean 





mtcars # this is a built in dataframe

mtcars['mpg']

str(mtcars)
names(mtcars)

mtcars$mpg # extracting a column from a dataframe






