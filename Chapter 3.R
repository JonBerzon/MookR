library(tidyverse)

#### 3.2.2 Creating a ggplot ####

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

##### 3.24 Exercises ####

#1. Run ggplot(data = mpg). What do you see?
ggplot(data = mpg)
#Nothing, no specification as to what variables should be mapped 

#2.How many rows are in mpg? How many columns?
nrow(mpg)
ncol(mpg)

#3.What does the drv variable describe? Read the help for ?mpg to find out.
?mpg
#drv describes whether its fwd, rwd or 4wd

#4.Make a scatterplot of hwy vs cyl.
ggplot(data = mpg)+
  geom_point(mapping = aes(x = cyl, y = hwy))

#5.What happens if you make a scatterplot of class vs drv? Why is the plot not useful?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = drv, y = class))
#There's no statistical relevance between drv and class. 2 categorical variables

##### 3.3 Aesthetic Mappings ####
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

ggplot (data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

ggplot (data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = 'blue')

#### 3.3.1 Exercises ####

#1. What's gone wrong with this code? why are the points not blue?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = 'blue'))
#blue was added as a third aesthetic variable instead of it's own aesthetic.
#needs to be put outside of (aes)

#2.Which variables in mpg are categorical? Which variables are continuous? (Hint: type ?mpg to read the documentation for the dataset). How can you see this information when you run mpg?
?mpg
#categorical: model, year, trans, drv, fl, class, displ
#continuous:  cyl, cty, hwy

#3.Map a continuous variable to color, size, and shape. How do these aesthetics behave differently for categorical vs. continuous variables?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = cyl))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = cyl))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = cyl))
#shape cannot be mapped to a continuous variable

#4.What happens if you map the same variable to multiple aesthetics?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = model, size = model))
#it's redundant and impossible to read

#5.What does the stroke aesthetic do? What shapes does it work with? (Hint: use ?geom_point)
?geom_point
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, stroke = 1))
#stroke lets u control the size of the dots in geom_point

#6.What happens if you map an aesthetic to something other than a variable name, like aes(colour = displ < 5)? Note, you'll also need to specify x and y.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = year <2008 ))
#creates a true or false aesthetic

#### 3.4 Common Problems ####
ggplot(data = mpg)
+ geom_point(mapping = aes(x = displ, y = hwy))
#pay attention to the placement of '+'

#### 3.5 Facets #### 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y= hwy)) +
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y= hwy)) +
  facet_grid(drv ~ cyl)

#### 3.5.1 Exercises ####

#1.What happens if you facet on a continuous variable?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_wrap( ~ cty)
#Since continuous have an inifinite amount of values, it doesn't make sence to use as a facet.

#2.What do the empty cells in plot with facet_grid(drv ~ cyl) mean? How do they relate to this plot?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_grid(drv ~ cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))
#the gaps are combinations that dont exist ex. 5 cylinder/4wd

#3.What plots does the following code make? What does . do?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

# "." discerns whether we want the grid to be on the rows or columns

#4. Take the first faceted plot in this section:
#What are the advantages to using faceting instead of the colour aesthetic? What are the disadvantages? How might the balance change if you had a larger dataset?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
#Faceting increases the legibility of between group differences.
#It also separates data though which decreases ur ability to see the big picture
#In a larger data set, faceting would be more useful for legibility reasons

#5. Read ?facet_wrap. What does nrow do? What does ncol do? What other options control the layout of the individual panels? Why doesn't facet_grid() have nrow and ncol arguments?
?facet_wrap
#nrow and ncol decide the number of columns or rows used to display the individual facets
#facet grid is a grid so the colums and rows would be set by the limits

#6.When using facet_grid() you should usually put the variable with more unique levels in the columns. Why?
# data is usually verticly rectangle letting u fit more items if based off columns verse vertical

#### 3.6 Geometric objects ####

