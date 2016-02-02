# Secret Function Tester

## Launch Instructions

1. Make sure you are running an updated version of Ruby
2. Clone repo and cd into parent directory
3. Run `ruby bin/secretTester` and follow prompts

## Customize Secret functions

Program defaults to one secret function. To enable others:

1. UNCOMMENT lines 4-13 in bin/secretTester and COMMENT out line 15.
OR
2. Erase SECRETS[3] from line 15, and set `secret` with your own Proc.

## Other notes

The code includes a quick-fail test to speed up huge inputs. Large numbers that ARE additive will take awhile. :)

## Orginal challenge

You are given a function 'secret()' that accepts a single integer parameter and returns an integer. In your favorite programming language, write a command-line program that takes one command-line argument (a number) and determines if the secret() function is additive [secret(x+y) = secret(x) + secret(y)], for all combinations x and y, where x and y are all prime numbers less than the number passed via the command-line argument.  Describe how to run your examples.

ENJOY!
