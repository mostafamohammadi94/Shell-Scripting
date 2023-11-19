# Shell Scripting

A shell script is **a computer program designed to be run by a Unix shell, a command-line interpreter**. The various dialects of shell scripts are considered to be scripting languages. Typical operations performed by shell scripts include file manipulation, program execution, and printing text.

-   The program that interprets and executes the various commands that we type in the terminal
-   Translates our command that the OS Kernel can understand

> This wiki is intended to hold documentation of GNU Bash. The main motivation was to provide *human-readable documentation* and information. the docs here are **not** meant as a newbie tutorial.

# Shebang #!

There is a line at the beginning of scripts which starts with `#!` and continues with an executable who needs to run this script. It is called shebang and as mentioned, tells the shell which *interpreter* must be used to run this script.

```plaintext
#!/bin/bash
```

Note: In many programming languages (including Bash & Python), a `#` at the beginning of a line in script indicates *comments*. Do not confuse it with the *Shebang* (`#!`)

```plaintext
#!/bin/bash

echo

echo "We are learning! Wowww..."

echo
```

> **Note:** You should make your script executable first:`*chmod +x script.sh*` 
> 
> to run an script: `./script.sh`

# Variables

Already seen in the previous section. You can define variables like this `VARNAME=VALUE`. Here is a sample:

```plaintext
#!/bin/bash

NAME=Mostafa

echo

echo "$NAME is learning! Wowww..." 

echo 
```

In bash you can access your variable via `$`

> **Note:** you can also do NAME="Mostafa is awesome" if you need to have spaces in your values

If you want to access the command line arguments in your shell script, use `$1`, `$2`, .... You can find the number of command line arguments via `$#` variable.

Store output of a command in a variable:

`variable_name=$(command)`

`` variable_name=`command` ``

# Bash syntax and operations

## Compound commands overview

|     |     |     |     |
| --- | --- | --- | --- |
| **Grouping** |     | **Loops** |     |
| ( … ) | command grouping in a subshell | for word in …; do …; done | classic for-loop |
| { …; } | command grouping | for ((x=1; x<=10; x++)); do ...; done | C-style for-loop |
| **Conditionals** |     | while …; do …; done | while loop |
| \[\[ ... \]\] | conditional expression | until …; do …; done | until loop |
| if …; then …; fi | conditional branching | **Misc** |     |
| case … esac | pattern-based branching | (( ... )) | arithmetic evaluation |
|     |     | select word in …; do …; done | user selections |

## **Performing Math**

Use `expr` or `$[ ]` or  `$((  ))` to do math in Bash.

|     |     |
| --- | --- |
| **Operator** |     |
| **expr ARG1 + ARG2** | **expr ARG1 > ARG2** |
| **expr ARG1 - ARG2** | **expr ARG1 >= ARG2** |
| **expr ARG1 \* ARG2** | **expr ARG1 != ARG2** |
| **expr ARG1 / ARG2** | **expr ARG1 = ARG2** |
| **expr ARG1 % ARG2** | **expr ARG1 <= ARG2** |
| **expr ARG1 < ARG2** |     |

```plaintext
#!/bin/bash
a=10
b=20


echo `expr $a - $b`
echo `expr $a + $b`
echo $(($a - $b))
echo $[ $a + $b ]
----------
./bash.sh
-10
30
-10
30
```

## **Bash Built-in Variables**

|     |     |
| --- | --- |
| **Variables** | **Description** |
| **$?** | Exit status of **last recently executed command** (0 or 1). |
| **$0** | Script name. |
| **$1 ~ 9** | n^th^ argument passed to the script or function. |
| **$\*** | a single string that consists of all of the positional parameters, separated by the first character in the environment variable IFS (internal field separator), which is a space, TAB, and NEWLINE by default. |
| **$@** | All arguments passed to the script or function; each argument is a separate word. |
| **$#** | Number of arguments passed to the script or function. |
| **$$** | PID of the script in which this variable is called. |
| **$!** | PID of the last recently executed background command. |
| **$\_** | set to last argument of previous command executed. |
| **$RANDOM** | Pseudorandom integer value between 0 to 32767. |

## **$? Exit Status Codes**

|     |     |
| --- | --- |
| **Code** | **Description** |
| **0** | Successful completion of the command. |
| **1** | General unknown error. |
| **2** | Misuse of shell command. |
| **126** | The command can’t execute. |
| **127** | Command not found. |
| **128** | Invalid exit argument. |
| **128+x** | Fatal error with Linux signal x. |
| **130** | Command terminated with Ctrl+C. |
| **255** | Exit status out of range. |

> **Note:** Unlike any other programing langues `0` is **True** and `1` is **False**.

## Condition

|     |     |     |
| --- | --- | --- |
| **Expression** | **Meaning** | **Operator** |
| **STRING1 = STRING2** | Strings are equal. | \=  |
| **STRING1 != STRING2** | Strings are not equal. | ≠   |
| **\-n STRING1** | String1 has a length greater than zero. |     |
| **\-z STRING1** | String1 has a length of zero. |     |
| **INT1 -eq INT2** | INT1 is equal to INT2. | \=  |
| **INT1 -ne INT2** | INT1 is not equal to INT2. | ≠   |
| **INT1 -ge INT2** | INT1 is greater than or equal to INT2. | ≥   |
| **INT1 -gt INT2** | INT1 is greater than INT2. | \>  |
| **INT1 -le INT2** | INT1 is less than or equal to INT2. | ≤   |
| **INT1 -lt INT2** | INT1 is less than INT2. | <   |
| **File1 -nt File2** | File1 is newer than File2 |     |
| **File1 -ot File2** | File1 is older than File2 |     |

## Using && and || in Bash Scripts

### `&&` (AND) and `||` (OR)

| **Operator** | **Description** | **Example** |
| --- | --- | --- |
| **!** | **This is logical negation. This inverts a true condition into false and vice versa.** | **\[ ! false \] is true.** |
| **\-o** | **This is logical** OR**. If one of the operands is true, then the condition becomes true.** | **\[ $a -lt 20 -o $b -gt 100 \] is true.** |
| **\-a** | **This is logical** AND**. If both the operands are true, then the condition becomes true otherwise false.** | **\[ $a -lt 20 -a $b -gt 100 \] is false** |

```plaintext
#!/bin/bash

a=10
b=20

[ $a -eq 10 -o $b -eq 20 ]
echo $?
[ $a -eq 10 -a $b -gt 20 ]
echo $?
[ $a -eq 10 ] || [ $b -ge 10 ]
echo $? 
[ $a -eq 10 ] && [ $b -ge 10 ]
echo $?
[[ $a -eq 10 || $b -ge 10 ]]
echo $?
[[ $a -eq 10 && $b -eq 10 ]]
echo $?
-------
./bash.sh 
0
1
0
0
0
1
```

# Functions

## Creating Functions

To declare a function, simply use the following syntax −

```plaintext
function_name () { 
   list of commands
}
```

The name of your function is **function\_name**, and that's what you will use to call it from elsewhere in your scripts. The function name must be followed by parentheses, followed by a list of commands enclosed within braces.

### Example

Following example shows the use of function −

```plaintext
#!/bin/sh

# Define your function here
Hello () {
   echo "Hello World"
}

# Invoke your function
Hello
```

Upon execution, you will receive the following output −

`$./test.sh     Hello World   `

## Pass Parameters to a Function

You can define a function that will accept parameters while calling the function. These parameters would be represented by **$1**, **$2** and so on.

Following is an example where we pass two parameters *Zara* and *Ali* and then we capture and print these parameters in the function.

```plaintext
#!/bin/sh

# Define your function here
Hello () {
   echo "Hello World $1 $2"
}

# Invoke your function
Hello Mostafa Mohammad
---------------
$./test.sh
Hello World Mostafa Mohammad
```

## Returning Values from Functions

If you execute an **exit** command from inside a function, its effect is not only to terminate execution of the function but also of the shell program that called the function.

If you instead want to just terminate execution of the function, then there is way to come out of a defined function.

Based on the situation you can return any value from your function using the **return** command whose syntax is as follows −

return code

Here **code** can be anything you choose here, but obviously you should choose something that is meaningful or useful in the context of your script as a whole.

### Example

Following function returns a value 10 −

```plaintext
#!/bin/sh

# Define your function here
Hello () {
   echo "Hello World $1 $2"
   return 10
}

# Invoke your function
Hello Zara Ali

# Capture value returnd by last command
ret=$?

echo "Return value is $ret"
```

Upon execution, you will receive the following result −

`$./test.sh     Hello World Mostafa Mohammad Return value is 10   `

## Nested Functions

One of the more interesting features of functions is that they can call themselves and also other functions. A function that calls itself is known as a ***recursive function***.

Following example demonstrates nesting of two functions −

```plaintext
#!/bin/sh

# Calling one function from another
number_one () {
   echo "This is the first function speaking..."
   number_two
}

number_two () {
   echo "This is now the second function speaking..."
}

# Calling function one.
number_one
------------------------
This is the first function speaking...
This is now the second function speaking...
```

## Function Call from Prompt

You can put definitions for commonly used functions inside your ***.profile***. These definitions will be available whenever you log in and you can use them at the command prompt.

Alternatively, you can group the definitions in a file, say ***test.sh***, and then execute the file in the current shell by typing −

`$. test.sh   `

This has the effect of causing functions defined inside ***test.sh*** to be read and defined to the current shell as follows −

`$ number_one     This is the first function speaking...     This is now the second function speaking...     $   `

To remove the definition of a function from the shell, use the unset command with the **.f** option. This command is also used to remove the definition of a variable to the shell.

`$ unset -f function_name   `
