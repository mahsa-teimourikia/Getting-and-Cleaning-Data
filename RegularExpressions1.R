# Regular expressions
## Regular expressions can be thought of as a combination of literals and metacharacters
## To draw an anology with natural language, think of literal text forming the words of this language,
## and metacharacters defining its grammar
## Regular expressions have a rich set of metacharacters

# Literals: simplest pattern only consists of literals. The literal "nuclear" could match exactly to the lines where the literal appears

# Regular expressions at their simplest form only consist of literals
## A match occurs if the sequence of literals occur anywhere in the text being tested

## We need a way to express:
### Whitespace word boundaries
### sets of literals
### the beginning and end of a line
### alternatives ("war" or "peace") metacharacters to the rescue!

# ^ for start of the line: ^ i think
# $ for end of the line: morning$
# List of set of characters we accept at a given point in the match: [Bb][Uu][Ss][Hh] matching Bush bush BUSH buSH,...
# Combining them together: ^[Ii] am
# Range of characters: [a-z] or [a-zA-Z]: ^[0-9][a-zA-z]
# Character classes in [] search for any matches that DO NOT indicate those chars: [^?.]$ -> meaning any line that does NOT end in any . or ?
# . is used to refer to any character: 9.11 -> matching 9 followed by any possible character followed by 11: e.g. 9-11, 9/11, etc.
# or | for any matches: flood|fire, ^[Gg]ood|[Bb]ad
# use of ():  ^([Gg]ood|[Bb]ad)
# ? indicates optional: [Gg]eorge( [Ww]\.)? [Bb]ush
# \. is a literal .
# * any number of times, + at least once: (.*) -> any character repeated any number of times inside paranthesis
### [0-9]+ (.*)[0-9]+ at least one number followed by any number of characteres followed by at least one number
# {} refer to minimum and maximum number of matches of an expression: [Bb]ush( +[^ ]+ +){1,5} debte ->bush followed by atleast one space, followed by something that is not space followed by at least one space between 1 and 5 times
# {m,n} between m and n matches, {m} exactly m matches, {m,} at least m matches
# () an be used to remember text matched by the subexpression enclosed
# We refer to the matched test with \1, \2, etc.
# +([a-zA-Z]+) +\1 + -> space follwed by some chars followed by space followed by the exact same match in the paranthesis followed by space
# * is greedy so it always matches the longest possible string that satisfies the regular expression
# ^s(.*)s -> Sitting at the Starbucks
# The greediness of * can be turned off with the ? -> ^s(.*?)s$

