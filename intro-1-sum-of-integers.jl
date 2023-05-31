### A Pluto.jl notebook ###
# v0.19.26

#> [frontmatter]

using Markdown
using InteractiveUtils

# ╔═╡ 436bc81c-4b79-4493-a890-93c1ab383c4b
using PlutoUI, CodeTracking

# ╔═╡ 13e02d69-36c4-46a8-b886-cec0696812ce
md"""
# Julia Introduction

## 1 - Calculating the sum of integers

### Setup

Suppose we want to calculate the sum of the integers $1$ to $100$. We can start off by typing simple sums, pressing enter, and Julia will be able to tell us the answer.
"""

# ╔═╡ 43a7caf8-3905-4b25-a206-0e78c7d71c19
1 + 2

# ╔═╡ f6b7f10f-bf75-4db1-917c-c4463de0d18e
1 + 2 + 3

# ╔═╡ ab1be286-9d26-4497-9f93-cc7e57dfd196
1 + 2 + 3 + 4

# ╔═╡ 384c16d7-6991-4ab2-af7a-72f26ca3cc59
md"""
However, this is would be quite annoying to have to type out all the way up to $100$. And what if we then decided we wanted to go to $1000$? Or $1$ million?

Instead, we want to be able to ask Julia to add up without us laboriously writing out every term of the sum. Luckily, we have plenty of choice of ways to do this.

### Variables and the `for` loop

Our first tool to introduce will be *variables*, which are names that we assign a value to, and then can use that name in place of the value. This allows us to write code that performs calculations where we don't explicitly tell Julia which numbers to use. A value is assigned to a variable using `=` as follows:
"""

# ╔═╡ fba34816-16d5-465c-ad40-0581a6b04a69
number1 = 1

# ╔═╡ 52568423-c854-41a0-9416-67c67bebb97f
md"""
Names of variables are important to choose carefully, as we don't want them to be misinterpreted by Julia, particularly if the name is already in use as a keyword. For readability of code, it should be named to make clear its purpose or value. We are also limited by Julia, which forces us to start the variable name with a letter, or letter-like symbol. Despite this, and unlike in many other languages, we can use a wide range of characters for variable names, including non-Latin scripts and some emoji.
"""

# ╔═╡ 0299df70-483b-4c0f-bcb4-99fbfb0e2d42
αριθμός2️⃣ = 2

# ╔═╡ c1d83184-9349-4cef-b39c-749c4432bdd1
md"""
Variables can be numerical, but they can also take many other different values depending on what we might use them for, e.g. some text, which we need surround with quotation marks to tell Julia to expect text and not try to run it as code.
"""

# ╔═╡ cee5db4a-96d0-49a0-9ce1-2379a2a57704
juliaURL = "https://julialang.org/"

# ╔═╡ b48478c1-cc7a-41d5-8412-4c6f9ac9cf53
md"""
Another common variable we might want to define is a list of values, which we can do by enclosing them in square brackets `[` and `]`, and seperating each 
by a comma: 
"""

# ╔═╡ 4bcbab83-e150-45f4-b14f-89da66190a1b
favouritenumbers = [7, 37, 137, 1089]

# ╔═╡ 62a4aa40-171a-4b7e-b8d2-25126f19909b
md"""
For better readability, it can sometimes be better to space out the list as follows, with one element on each line. It's usually preferable to have many short lines rather than one long one.
"""

# ╔═╡ 1e1cc63d-8ce7-40c4-a80a-059618643f79
menonthemoon = [
	"Neil Armstrong",
	"Buzz Aldrin",
	"Pete Conrad",
	"Alan Bean",
	"Alan Shepard",
	"Edgar Mitchell",
	"David Scott",
	"James Irwin",
	"John Young",
	"Charles Duke",
	"Gene Cernan",
	"Harrison Schmitt"
]

# ╔═╡ 7ccc07a6-03f5-4c7b-bb64-86fc799c8eb9
md"""
We can ask Julia to tell us the value of the variable simply by typing the name of that variable.
"""

# ╔═╡ 331f45b1-8787-4908-b5da-7433272aff74
number1

# ╔═╡ 0d8d8f18-1c46-4fe3-965c-6980b6385995
md"""
We can then use the names in place of the values they represent in sums.
"""

# ╔═╡ 555171f2-d540-4168-b134-933f0fbfbd41
number1 + αριθμός2️⃣

# ╔═╡ e9fa46d0-9b18-4e81-8296-cf45c86f2c77
md"""
So what? We've managed to write several lines of code that did exactly what we managed before in one. This looks more like a step backwards than a step forwards at the moment.

The crucial aspect of the variable is that we can change its value without changing its name. This means we can ask Julia to repeat the same operations again and again (that is, adding the next number to a running total) by only writing it once.

We'll start by giving a variable the name `runningtotal`, with starting value `0`.
```julia
runningtotal = 0
```
Then, we'll use a `for` loop. A `for` loop takes the form:
```julia
for <variable-name> in <list-of-things>
	<code-to-loop>
end
```
The names in angle brackets are not correct Julia syntax (if you tried to run this as is, Julia would get very confused!), but are meant as placeholders to describe what code should be put in that place. We've seen some examples of lists of things before, but many other types of data can perform the same function. The `for` loop goes through the list, taking each item one at a time, giving it the ascribed name, and then running the following section of code on that item. The keyword `end` is necessary to tell Julia when we want it to go back to the start of the loop with the next item from the list.

For our purposes, we'll take the list to be `1:1000`, which denotes the integers between $1$ and $1000$, including both ends. The variable will be called `n`, and within the loop, we'll add `n` to the running total.
```julia
for n in 1:1000
	runningtotal = runningtotal + n
end
```
Notice that the `=` sign does not mean the same as it would mathematically, as clearly this would be a false equation. Instead, Julia calculates the right hand side, and then sets the variable on the left hand side to take that value, which in this case overwrites the original value of `runningtotal` to be the new sum.

Putting this together, we can run the loop:
"""

# ╔═╡ b8130781-89de-4b15-aba1-64179487df27
begin
	# Set the initial value to 0
	runningtotal = 0

	# Add each number from 1 to 1000 in turn
	for n in 1:1000
		runningtotal = runningtotal + n
	end
end

# ╔═╡ ec5b66bd-2f4e-4228-9bc9-69866324efe4
md"""
There's a couple of things to say here. The `begin`-`end` block here is useful for typing out multiple statements at a time without Julia running them one by one automatically. It function almost like a set of parentheses would in algebra, opening with a `begin`, and Julia will evaluate the contents in side all at once when you've closed with an `end`. In this instance, it's useful to set the initial value of `0` and then run the loop all in one go, so if we want to try it again, we don't need to remember to reset the value of `runningtotal` again.

Also, we see the text after the hash symbol `#` is pink, italicised, and also isn't code. This is because it is a *comment*, as marked by the `#`, and is ignored by Julia, while allowing us to read it so that we can more easily understand what is happening. Comments are very useful, particularly if you come back to code you've written some time ago, and you've forgotten what you were trying to do. They are also very useful if someone else wants to see what you've done, and you aren't there to explain it.

Now, to find the final value of the `runningtotal`, we simply type its name to ask Julia what it's value now is.
"""

# ╔═╡ c69ad2b9-fba0-4ef4-9bbb-e56e64c659e9
runningtotal

# ╔═╡ 70e11d9b-a09e-4392-9442-b1412a129401
md"""
### Functions and types

Just because we've solved the problem, that doesn't mean it's not worth looking for more solutions, especially if we can improve on our original method in some way. As we'll see, there are several other ways of summing the integers $1$ to $1000$ that can teach different ideas.

There's an often recounted story about the 19th century German (as much as German meant anything back then) mathematician Carl Friedrich Gauss being asked to sum the numbers $1$ to $100$ by a teacher who presumably wanted a quiet half hour to themselves, and coming up with the right answer $5050$ almost immediately. Given the countless retellings over the last 200 years, it's difficult to say how much truth there is to it, but nonetheless it does demonstrate that there is a shortcut specific to this problem.

First, we write down the numbers from $1$ to $100$ in a row. Below them, we write down the same sequence, but backwards. We then sum each column of two numbers:
```math
+\quad \begin{matrix}
1 & 2 & 3 & \cdots & 98 & 99 & 100 \\
100 & 99 & 98 & \cdots & 3 & 2 & 1 \\\hline
101 & 101 & 101 & \cdots & 101 & 101 & 101 \\
\end{matrix}
```
All of the answers are $101$! We can add up all of the numbers on both rows by adding up the column sums, i.e $101 \times 100 = 10100$. Then, since we wrote down every number between $1$ and $100$ twice, we want to halve this to get the sum we're looking for:
```math
1 + 2 + 3 + \dots + 99 + 100 = \frac{10100}{2} = 5050
```
In fact, we can do the same thing for the sum from $1$ to $N$, and get a general formula:
```math
+\quad \begin{matrix}
1 & 2 & 3 & \cdots & N-2 & N-1 & N \\
N & N-1 & N-2 & \cdots & 3 & 2 & 1 \\\hline
N+1 & N+1 & N+1 & \cdots & N+1 & N+1 & N+1 \\
\end{matrix}
```
```math
1 + 2 + 3 + \dots + (N-1) + N = \frac{1}{2} ((N + 1) \times N) = \frac{N(N+1)}{2}
```
Well this is much easier, in fact we don't even need Julia any more to calculate the sum of integers from $1$ to $1000$, as it will be:
```math
1 + 2 + 3 + \dots + 999 + 1000 = \frac{1000 \times 1001}{2} = \frac{1001000}{2} = 500500
```
Instead, lets suppose we want a way to sum the integers from $1$ to $N$, for any value of $N$ we might choose, without having to write out the formula every time. For this, we'll need a `function`, which allows a predetermined set of calculations to be done for any given input. We can evaluate a function by:
```julia
<function-name>(<input-1>, <input-2>, etc.)
```
The number of inputs we need to provide, and what values they might take, will depend on what the function is. Julia has many inbuilt functions for various tasks, such as the following:
"""

# ╔═╡ 76fd5952-1f93-46d7-b52d-1c278be463c9
min(45, 54) # Finds the minimum of its inputs

# ╔═╡ 3b8bfc96-ad4f-4158-ac00-0ac3ca4168d4
reverse("desserts") # Reverses the text input

# ╔═╡ 34afd85a-d207-4594-8f34-a1d755af5f4e
length([12, 34, 56, 78]) # Counts the number of items in the list

# ╔═╡ 302bff22-427a-4124-8504-b2ffc23fe0f9
md"""
In several of these cases, we could guess that the function will fail if we provide nonsensical inputs, such as trying to find the `min` of `"beetroot"` and `"cucumber"`, or the `length` of `12`. However:
"""

# ╔═╡ a92fb6c1-7438-450e-9944-35a3b081d929
min("beetroot", "cucumber")

# ╔═╡ 1322f90d-f3fa-48be-a6c0-c53719b9d1b0
length(12)

# ╔═╡ 12d24fcb-ac05-4571-84fa-6e8cb4518be9
md"""
This is because functions can change their behaviour depending on what is input. Usually, `min` finds the smallest of two numbers, but if it receives text instead, it finds the first alphabetically. Meanwhile, if `length` gets a single item instead of a list, it considers it a list with only one item in it, and so tells us we have a list of length 1. This isn't universally true however, as putting the wrong data into a function can simple cause an error:
"""

# ╔═╡ e2db0db4-b1a9-4719-b286-f2534caf9cf6
reverse(34)

# ╔═╡ 0c43323c-7429-4efa-97d2-4ffd0d3e080e
md"""
We can also write our own functions, if no inbuilt function does what we want. The syntax for this will look like:
```julia
<function-name>(<input-1>, <input-2>, etc.)
	<code-to-run>
	return <output-value>
end
```
The function name is much like a variable name, and we should choose it to represent what we want it to do. We specify the number of inputs, and give them variable names in the function definition so we can use them in calculations, but we don't have to give them values yet. We then write the code that performs our desired computations, and follow the keyword `return` with the value we want the function to output.

It's important to note that any variable names you refer to inside the function definition (including in the inputs) will only exist within the function, and you won't be able to refer to them outside. This is because they are simply placeholder names, and don't even have a value except while the function is evaluating.

We'll now write a function of our own to calculate the sum from $1$ to $1000$, using the formula we found earlier. Muliplication is written with an asterisk `*`, and division with a forward slash `/`, so our desired function is:
"""

# ╔═╡ dedcd707-7006-4aee-8a98-4555de8abf79
# v1 for version 1, we'll be seeing many more versions!
function sum1toNv1(N)
	# Formula for summing integers from 1 to N
	return (N * (N+1)) / 2
end

# ╔═╡ 3af292c8-ad77-4647-b3ef-052ab0f27958
md"""
We've used `N` here as our variable name, which isn't very descriptive, but the comment makes it clear what it represents, so it's an acceptable choice of variable name. As mentioned before, it doesn't exist outside of the function, so we can't ask Julia its value:
"""

# ╔═╡ 6967daa6-22e5-4e31-8fe4-6db425196767
N

# ╔═╡ 11a32064-a71d-4848-a206-c4d10a21dcce
md"""
Let's try this out with $N = 1000$, and see if we get $500500$ as expected:
"""

# ╔═╡ c39614fe-a296-4c24-b280-3f47b6f166be
sum1toNv1(1000)

# ╔═╡ e9825754-b1df-4a40-ae5b-be2ec18319a7
md"""
It's not wrong, but it's not what we were expecting either. Why does Julia bother to write a `.0` after the number? This is because every value in our code, every variable, even every word of code we write, has a hidden property called its *type*. We've already seen how the value that a variable takes can be one of many different forms, and these are examples of types:
- `Int64` is the type corresponding to integers
- `Float64` is the type corresponding to decimals
- `String` is the type corresponding to text
- `Vector` is the type corresponding to lists contained in square brackets
- `UnitRange` is the type corresponding to lists of numbers such as `1:1000`
- `Function` is the type corresponding to functions, whether custom or inbuilt into Julia
We can use the inbuilt function `typeof` to ask Julia what the type of a given variable or data input is:
"""

# ╔═╡ e12c4612-5f13-4cfd-aa39-3fea59369ec6
typeof(sum1toNv1(1000))

# ╔═╡ 4008ebe6-5fbb-4537-b1e5-aa2825a995c4
md"""
Shouldn't it be an integer, i.e. `Int64`? No, as there are good reasons you might want to use this number as if it were a decimal, just with zero decimal part. `Float64` accommodates integers as well, but to distinguish the two types when displaying their values, Julia adds `.0` to the end of the `Float64` to signify the zero decimal part.

But why do we get a `Float64` out in the first place? Types are what Julia uses to work out how to treat data, such as when it is input into a function, as we saw before. Indeed, the error message we saw when we tried `reverse(34)` said
```julia
MethodError: no method matching reverse(::Int64)
```
by which it means there is no definition for the function `reverse` that allows a single input of type `Int64`, which is what we gave it in the form of `34`.

The method by which Julia evaluates how a function will run depending on the types of its inputs is called *multiple dispatch*. It is a very useful tool to have in the toolbox, one of Julia's most powerful, but for now we'll just be aware of its existence and its consequences for the functions that we may use.

Why is this relevant to the unexpected `.0`? Well, the division `/` is a function, just with special syntax as it is so commonly used, and dividing an `Int64` by an `Int64` cannot return an `Int64`, as you don't always get an integer when dividing two integers. Instead, it always returns a `Float64`, even if the answer we get doesn't end up having decimal places.

To get from our `Float64` `500500.0` to our expected integer output `500500`, we can use the inbuilt `convert` function, which will try to convert our `Float64` into `Int64`, giving an error if this isn't possible.
"""

# ╔═╡ b318072e-3bbd-401a-b1e9-c2b44e0193eb
function sum1toNv2(N)
	# Formula for summing integers from 1 to N
	sumFloat64 = (N * (N+1)) / 2
	# Corrected by converting the answer back into an Int64
	return convert(Int64, sumFloat64)
end

# ╔═╡ 17e02f77-29b9-4b2f-bdd2-ea92d4af061f
sum1toNv2(1000)

# ╔═╡ d15e57a4-525e-480b-b0b7-a64dde0b822c
md"""
### `if` statements and recursion

We've seen two ways of solving our summing problem, but there's still more! Our next method will introduce *control flow*, in particular the `if` statement, which allows you to change what instructions your program runs depending on whether or not a condition is met. This will improve on our previous approach by allowing us to test if the input is sensible, since currently:
"""

# ╔═╡ 6bfd5cda-cb7d-4e42-b2ee-9f300842b32e
sum1toNv2(-53)

# ╔═╡ 393bf9ec-47dc-4f1c-a32e-c7ba79fd6cbb
md"""
The `if` statement takes the following generic form:
```julia
if <condition>
	<code-if-true>
else
	<code-if-false>
end
```
The condition can be written in many ways, but some of the most common are:
- `<value-1> == <value-2>` checks if the two values are equal. Conversely `<value-1> != <value-2>` checks if they are not equal.
- `<value-1> < <value-2>` checks if the first value is less than the second. The same works with `>` for greater than, `<=` for less than or equal to, and `>=` for greater than or equal to.
- `!<condition>` reverses the condition (so is true if the condition is false, and vice versa)
- `<condition-1> && <condition-2>` is called `AND`, which is true only when both conditions are met. Similarly, `<condition-1> || <condition-2>` is called `OR`, true when either (or both) of the conditions are met.
- Many functions can give conditions, usually ones with names beginning with `is`. For example, `iseven(N)` is true when the input `N` is an even number, and `issorted(v)` is true when the input `v` is a `Vector` type with all elements in order, such as `[1, 2, 3]` or `["a", "b", "c"]`
We can try some of these conditions just by themselves, without the `if` statement, and Julia will tell us if they are true or false.
"""

# ╔═╡ 5d20d615-8ed2-4dfe-b5cd-ebd05021e804
6 < 2

# ╔═╡ 7040d8bc-7be3-486f-9044-a551d3f9dc36
"giraffe" < "hippopotamus" # Here, < means alphabetically before

# ╔═╡ 525efd81-d791-4dc7-8197-f31d5d349614
(iseven(12) && (3 == 2 + 1) && (5 + 3 == 2 * 4)) || iseven(3)

# ╔═╡ d3bbf8a2-2b55-4da4-84de-1bbb91034f72
md"""
But if these values can be displayed by Julia, couldn't we make them into a variable? Indeed, we can (which is how the functions like `iseven` do it!), using the special type `Bool`, which can only be one of two values, `true` and `false`.
"""

# ╔═╡ e7f3f8d0-d267-4034-9458-bbfe04eba9bb
biggestnumber = (5 == max(1, 2, 5, 7))

# ╔═╡ 3dd8fdf7-a377-4707-9daf-d7316b3b0a81
typeof(biggestnumber)

# ╔═╡ a1d1b759-14e3-4257-9a2a-25685e440be4
md"""
Any `Bool` variable can then be used in place of a condition.

For our purposes, we want to check if the input to our function to sum from $1$ to $N$ is sensible, so we need it to be an integer which is at least $1$. We can write our own function for this, which returns a `Bool` to be used later as a condition:
"""

# ╔═╡ 9ab3b30b-8568-4d51-8117-096cf4022df7
function isvalidN(N)
	# True if N is both an integer and greater than or equal to 1, false otherwise
	return isinteger(N) && (N >= 1)
end

# ╔═╡ e822aace-5625-44d4-9a45-d7315c1a3c2d
isvalidN(1000)

# ╔═╡ 1bef8c16-f9a4-4943-8d2c-7e7e3f0b83d5
isvalidN(-53)

# ╔═╡ 739a344c-e4d4-4a56-83a0-5a908c12e9c5
md"""
We can now put that check before running our `sum1toNv2` function, using the `error` function to give our own error message.
"""

# ╔═╡ 76f5a002-dcfa-4b12-9925-1791a647f198
function sum1toNv3(N)
	# Checks if N is valid, if so, we can calculate as before
	if isvalidN(N)
		return sum1toNv2(N)
	else
		# If N is invalid, an error message is displayed
		error("must be an integer and at least 1")
	end
end

# ╔═╡ 98164b38-75b5-4795-b4ea-8c651148bf38
sum1toNv3(1000)

# ╔═╡ af820f0a-edeb-4078-9e08-7ce27ee81acf
sum1toNv3(-53)

# ╔═╡ 09190732-e098-41f5-a49a-1a59e6877a7c
md"""
We're not done with `if` statements quite yet though, as we can use them in introducing another programming technique, *recursion*. A function written with recursion has its output depend on evaluating the function on another input, usually a number one less than you began with, or perhaps a list with one less item. For recursion to work, it is crucial to implement some sort of stopping point, which doesn't rely on a further value of the function, otherwise it would keep going on forever, and this is often easiest to do with an `if` statement. As an example, here's an implementation of our usual summing from $1$ to $N$ function using recursion:
"""

# ╔═╡ 0043b05b-cd56-4434-9ccd-953e26408729
function sum1toNv4(N)
	# Stopping point for recursion, when N is 1, the sum from 1 to N is just 1
	if N == 1
		return 1
	else
		# Recursively calculates the sum from 1 to N-1, then adds N
		return (sum1toNv4(N - 1) + N)
	end
end

# ╔═╡ b625696b-b6cc-4880-8334-3f2ecc48285f
md"""
Let's try this out on some inputs:
"""

# ╔═╡ 8431135c-a504-4e5d-9533-7d746ae8194d
sum1toNv3(1000)

# ╔═╡ ddd6b5b8-fce6-4ff1-b267-c7de331bb0fa
sum1toNv4(-53)

# ╔═╡ 71ee3093-a385-40d4-9a54-805b9cbbe415
md"""
What's happened here? By starting at the nonsensical value `-53`, we've ensured that the recursion can never stop, as no matter how many times we subtract `1`, we'll never get to `1`. Julia has inbuilt protection against this: if your function recurses too many times, it stops calculating and gives you an error message. Of course, we've missed the `isvalidN` function! Let's add that into our next version:
"""

# ╔═╡ d1d4e9db-580e-4f05-b20e-02e91913162f
function sum1toNv5(N)
	if !isvalidN(N)
		error("must be an integer and at least 1")
	# Missing out "else" is fine, Julia will just continue running past "end"
	end

	# No need to write the recursion again, this will work as we've checked the input
	return sum1toNv4(N)
end

# ╔═╡ 0233b860-07fd-4049-8419-d50521604d12
sum1toNv5(1000)

# ╔═╡ 60cae1f1-7e98-4044-b8cf-0270247e9672
sum1toNv5(-53)

# ╔═╡ 9c912014-5f1c-4c48-9573-ca82098bcc6c
md"""
However, we can still cause the same error as before by choosing a large enough value for `N`, in which case too much recursion will have happened before we get to `1`:
"""

# ╔═╡ 7b09a073-decc-4c1c-9a7c-06fcb63e4641
sum1toNv5(1000000)

# ╔═╡ d98f015e-c224-4705-830c-4da2c0d28e44
md"""
There's another problem in recursion, which is efficiency. To calculate the sum from $1$ to $N$, our recursive function `sum1toNv4` has to do $N-1$ different sums, adding each number onto the preceding sum. Meanwhile, `sum1toNv2` has to do an addition, a multiplication, a division, and a type conversion, which is always four things however large $N$ is (although they do get slower the larger $N$ is, but not by the same amount as the recursive function).

This means that for larger inputs, recursion can be quite slow. Julia has inbuilt timing functionality, for example by preceding our line of code with `@time`, we get an output to the console stating how long that line took.
"""

# ╔═╡ 939e2684-ce44-4d57-bd16-ec10d0a4183e
@time sum1toNv2(50000)

# ╔═╡ 3bef023a-a141-44dd-942f-5334eda26bdc
@time sum1toNv4(50000)

# ╔═╡ 244e012a-b45a-451c-9b8a-b2622c6f928c
md"""
As we can see, the recursive method is far slower, so it's probably not the right solution to this problem. That isn't to say it wouldn't be useful in other situations, particularly if there is no neat formula as there is in this instance.

As a side note, we've just seen a new type of feature of Julia, the *macro* `@time`. Macros, which look like `@<macro-name>`, are like functions in that they take an input and give an output, but their inputs are not values in parentheses, but the line of Julia code following them. They can then do something dynamically with the code, that may or may not involve running it. There are many inbuilt macros, some of which we'll meet later, and much like functions, we can write our own (although we won't have a need for that in this example).
"""

# ╔═╡ 532c2e54-4204-4dcc-88a5-8591cd0b0ca5
md"""
### Into the source code

Picture the scene. You're stuck, on the same problem you've been stuck on for what feels like hours. Maybe days even, when did you last prise your eyes away from the computer screen and look outside? Searching online has only confused you further, and you feel like your knowledge of Julia just isn't getting you far enough towards a solution. Exhausted, you can only summon the willpower to type four more characters, and press enter:
"""

# ╔═╡ 25b7b491-0dc5-4c61-a98c-d7a0dab7ea3b
help

# ╔═╡ 2627af37-6ace-469e-992b-ea7ab35bc8c5
md"""
Ok, maybe that's a little dramatic. But it's nice to see that Julia provides some further directions of where to go for help.

The quickest and most useful thing you will do is look for help for a function, to see what it does. This is done in the REPL by typing `?` followed by the name of the function, as the message above says, or using the macro `@doc` as demonstrated below. Many functions with multiple definitions for different input types may display a large block of help text for the many different ways that the function could be used, but by specifying an argument, this can be reduced to just the one you want.
"""

# ╔═╡ 8dac60ac-5e2a-4d40-a5b4-726b8ced3e72
@doc sqrt(100)

# ╔═╡ f1023faa-ea32-41b9-ba2c-7c0c41321fc7
md"""
Also useful is the online documentation and manual for Julia, provided at [https://docs.julialang.org/](). By navigating using the menus on the left, or the search at the top left, you can find a glut of information on all aspects of Julia programming, from the most basic to much more specialised and advanced. Similar documentation is provided by many of the most common packages for Julia, such as *Plots.jl* at [https://docs.juliaplots.org/]().

It's always worth checking before you define a variable or a function whether that name is already in use by something else, with the `?` functionality of the REPL or `@doc` macro usually the easiest way to see this. For example, the names `sum1toNv1` etc. were chosen above because `sum` is already taken. What does `sum` do? Let's see:
"""

# ╔═╡ bb9a2bd4-5a94-4fe1-ae09-f9a62eb387d9
@doc sum

# ╔═╡ 41815fb9-9d6e-419b-a4c5-e6f9e3d26b2f
md"""
That's quite a lot of text. Indeed, we can see all of the *methods*, that is possible versions of the function depending on the input types, using the function `methods`:
"""

# ╔═╡ 5b11eba4-3be8-4be4-99d5-854eda34002d
methods(sum)

# ╔═╡ 3156fe5c-e2bd-4989-ae4a-b0161b5814fe
md"""
If we look at the documentation carefully, we spot the line:
```julia-repl
julia> sum(1:20)
210
```
That looks like what we want to do! Indeed:
"""

# ╔═╡ 95aa016d-cac0-4652-b946-b26195728dde
sum1toNv2(20)

# ╔═╡ a97d8aff-ec45-4ad1-aa3c-742dd42a25fe
sum(1:1000)

# ╔═╡ f97cb57b-8a91-4e78-9895-f082541acead
md"""
Evidently, this is the quickest way to solve the problem we had. But how does this function do it? One of the great aspects of Julia is that even the inbuilt functionality is publically available, and most of it (apart from the absolute lowest level parts) is written in Julia. So we can go and find where this function is defined, and see what calculations it's doing.

First, to find the method that has been used for this particular input, we can either look through the output of `methods` to identify it, or easier, use the macro `@which`:
"""

# ╔═╡ 642826e2-76a8-4afa-9dd2-4445640dde52
@which sum(1:1000)

# ╔═╡ 7df3757d-5aeb-4961-a7f8-2522179e9ad9
begin
	summethod = @which sum(1:1000)
	
	md"""
	Julia's source code can be found at [https://github.com/JuliaLang/julia/](). We're told that this definition is in `Base`, so we navigate into the folder *base*, and find *$(summethod.file)*. Scrolling down to line number $(summethod.line), we find the function definition:
	"""
end

# ╔═╡ e4717fec-3888-4739-8bf8-7f29b6f3867e
eval(Meta.parse("md\"\"\"
```julia
$(@code_string sum(1:1000))
```
\"\"\""))

# ╔═╡ 7e5bd743-d2cd-4568-892e-8cc082a46f18
md"""
Let's unpack what this means. Firstly, we note that its input has `::AbstractRange{<:Real}` after it. The second type following the first in curly brackets `{}` is called a *parametric type*, which tells Julia something more about the type than the inital name suggests. The expression as a whole is used for multiple dispatch to tell Julia what types are allowed to be used in this method. But our input `1:1000` seems to have the wrong type:
"""

# ╔═╡ bdb34b79-18f1-4a5d-a355-371dcf09a282
typeof(1:1000)

# ╔═╡ db92f904-896d-42a5-b32f-b9ef93e552e0
md"""
Types aren't disconnected from each other, however, and they are coded to inherit from other code types, allowing them to behave like one for the purposes of multiple dispatch (among other uses). As it turns out `UnitRange` is a subtype of `AbstractRange`, and the parametric type `Int64` is a subtype of `Real`. Anything that can be *promoted* to, i.e. is a subtype of, `AbstractRange` is acceptable as a type, while `<:Real` means that the parametric type associated must be a subtype of `Real`. Both of these conditions are met, so `1:1000` is a valid input for this method and we can proceed with it.

Now let's look at what the rest of the function does. There's a couple of bits of syntax we haven't met before, the `?`, the `:`, and the `>>` (we've seen all these symbols used before, but for different purposes). We can find what these do with the help functionality that we've already seen.

The `?` and `:` go together as part of the *ternary operator*, which allows for a shorter way to write `if`-`else` statements in specific cases. Specifically, it equates to the following code:
```julia
if <condition>
	x = <value-1>
else                   ←--→       x = <condition> ? <value-1> : <value-2>
	x = <value-2>
end
```
"""

# ╔═╡ b54d281a-4d0f-4a9e-acfa-2cf877df81e1
parity12 = iseven(12) ? "even" : "odd"

# ╔═╡ e4582502-ac71-43f6-a439-84b564e4b7c4
parity13 = iseven(13) ? "even" : "odd"

# ╔═╡ 273c7bb1-8d4a-4476-9c25-f0e0a9481e03
md"""
The `>>` means a right bit shift by 1. Since all of the numbers are stored in the computer as binary numbers, this shifts the digits of a number to the right. We can imagine in our base $10$ system that shifting all the digits right one place would have the effect of dividing by $10$, so the bit shift has the effect of dividing our number by $2$:
"""

# ╔═╡ b0beb926-67c7-4478-a153-320621ab8483
14 >> 1

# ╔═╡ 0ab10a88-4551-4177-aeb5-0d6841db037e
md"""
Why does it say that *"care is required"*? Well, `>>1` isn't exactly like dividing by $2$, because for odd numbers, it will lose the remainder:
"""

# ╔═╡ 41c29081-a62f-4944-bb28-e3d55353656d
7 >> 1

# ╔═╡ 56314eb8-ce75-4348-8682-b37cee918c23
md"""
Hence, if `l` is even, it divides that by $2$, and if not, then `l` is odd, but `l-1` is even, so it divides that by $2$ instead. Clever! And avoids the issue with `Float64`s when dividing earlier.

The two functions `first` and `step` tell us the first value in the input range (which for us is always $1$) and the gap between successive values (again, always $1$ for us, as we're dealing with sequences of successive integers). We can now understand what the function is doing on the input `1:N`:
- First, it finds the length of the range, which is `N`
- Next, it multiplies this by `1`, giving `N`
- If `N` is even, it halves it and multiplies it by `N-1`
- If `N` is odd, it halves `N-1` and multiplies it by `N`
- Then, it adds the `N` it calculated earlier to whichever product it gets, and outputs the result
Algebraically, then, it does:
```math
N + \frac{N}{2} \times (N - 1) \quad \text{or} \quad N + \frac{N-1}{2} \times N
```
which is equal to ``\frac{N(N+1)}{2}`` in either case. So it's more or less doing our `sum1toNv2` method, just altered to work for a wider range of inputs.

In this case, we haven't really found a new way of solving the problem, but we have learnt a few things about Julia along the way. Journeying into the source code like this can be overwhelming at times, but it can also show you ways of doing things that you may not have come across before, and are likely optimised to work as well as possible for all sorts of applications.

One final note: we started by adding up integers by typing the sum out by hand, but stopped because we quickly realised it would be inefficient. However, what if there was a way to effectively make Julia write out the sum, and then evaluate it? In fact, there is:
"""

# ╔═╡ 7fa88865-3a70-4c84-a5e9-d8b207d1f8d4
eval(Meta.parse(*(["$n + " for n ∈ 1:999]..., "1000")))

# ╔═╡ 6002b050-2d81-48a0-af1b-c66c33f1cf2c
md"""
There are several concepts used here that haven't been covered above. Nonetheless, if you feel like a challenge, the names of the concepts are listed below, with brief explanations if you hover over the blurred text, but you are encouraged to use `?`, `@doc`, and the Julia manual [https://docs.julialang.org/]() to learn what each part means.
"""

# ╔═╡ 20221034-f548-404d-8b0d-b7cb55ac5223
Markdown.MD(Markdown.Admonition("hint","String interpolation",[md"By following a dollar sign `$` with a variable name, the string is created with the value of that variable inserted. [Read more](https://docs.julialang.org/en/v1/manual/strings/#string-interpolation)."]))

# ╔═╡ aa96aebe-94e7-4aaf-9c23-dd244df07623
Markdown.MD(Markdown.Admonition("hint","Array comprehension",[md"A vector (or larger array) can be created by giving values for each of a sequence of indices. This is done by giving the value, followed by the familiar start of a `for` loop. [Read more](https://docs.julialang.org/en/v1/manual/arrays/#man-comprehensions)."]))

# ╔═╡ 0f367f9f-dc9e-4356-8417-f38cc019e341
Markdown.MD(Markdown.Admonition("hint","∈",[md"An alias for the keyword `in`, typed by `\in` followed by pressing tab."]))

# ╔═╡ 88921dbf-52c8-4aef-9350-597da5459d5c
Markdown.MD(Markdown.Admonition("hint","Splatting",[md"Syntax to empty out the contents of a list into individual inputs into a function. [Read more](https://docs.julialang.org/en/v1/manual/functions/#Varargs-Functions)."]))

# ╔═╡ 604cc63e-01d2-4902-8d4d-e607aaf4ed77
Markdown.MD(Markdown.Admonition("hint","String concatenation",[md"The asterisk function `*` with arbitrarily many string inputs outputs one long string given by putting the inputs end to end. [Read more](https://docs.julialang.org/en/v1/manual/arrays/#man-comprehensions)."]))

# ╔═╡ f1d171e8-ebc0-460d-8cb8-cd2bf4e1e5d4
Markdown.MD(Markdown.Admonition("hint","Evaluating strings as code",[md"Combining the functions `eval` and `Meta.parse` simulates how Julia reads code and turns it into instructions. [Read more](https://docs.julialang.org/en/v1/manual/metaprogramming/#Program-representation)."]))

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CodeTracking = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
CodeTracking = "~1.3.1"
PlutoUI = "~0.7.51"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.0"
manifest_format = "2.0"
project_hash = "ecb4cb1efc10e2ebcdc18c8559b1ba2d6e98472b"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "d730914ef30a06732bdd9f763f6cc32e92ffbff1"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.3.1"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.2+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "d75853a0bdbfb1ac815478bacd89cd27b550ace6"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.3"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.10.11"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.21+4"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "a5aef8d4a6e8d81f171b2bd4be5265b01384c74c"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.10"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.9.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "b478a748be27bd2f2c73a7690da219d0844db305"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.51"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "259e206946c293698122f63e2b513a7c99a244e8"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.1.1"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "7eb1686b4f04b82f96ed7a4ea5890a4f0c7a09f1"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.9.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "Pkg", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "5.10.1+6"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "aadb748be58b492045b4f56166b5188aa63ce549"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.7"

[[deps.URIs]]
git-tree-sha1 = "074f993b0ca030848b897beff716d93aca60f06a"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.4.2"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.7.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╟─13e02d69-36c4-46a8-b886-cec0696812ce
# ╠═43a7caf8-3905-4b25-a206-0e78c7d71c19
# ╠═f6b7f10f-bf75-4db1-917c-c4463de0d18e
# ╠═ab1be286-9d26-4497-9f93-cc7e57dfd196
# ╟─384c16d7-6991-4ab2-af7a-72f26ca3cc59
# ╠═fba34816-16d5-465c-ad40-0581a6b04a69
# ╟─52568423-c854-41a0-9416-67c67bebb97f
# ╠═0299df70-483b-4c0f-bcb4-99fbfb0e2d42
# ╟─c1d83184-9349-4cef-b39c-749c4432bdd1
# ╠═cee5db4a-96d0-49a0-9ce1-2379a2a57704
# ╟─b48478c1-cc7a-41d5-8412-4c6f9ac9cf53
# ╠═4bcbab83-e150-45f4-b14f-89da66190a1b
# ╟─62a4aa40-171a-4b7e-b8d2-25126f19909b
# ╠═1e1cc63d-8ce7-40c4-a80a-059618643f79
# ╟─7ccc07a6-03f5-4c7b-bb64-86fc799c8eb9
# ╠═331f45b1-8787-4908-b5da-7433272aff74
# ╟─0d8d8f18-1c46-4fe3-965c-6980b6385995
# ╠═555171f2-d540-4168-b134-933f0fbfbd41
# ╟─e9fa46d0-9b18-4e81-8296-cf45c86f2c77
# ╠═b8130781-89de-4b15-aba1-64179487df27
# ╟─ec5b66bd-2f4e-4228-9bc9-69866324efe4
# ╠═c69ad2b9-fba0-4ef4-9bbb-e56e64c659e9
# ╟─70e11d9b-a09e-4392-9442-b1412a129401
# ╠═76fd5952-1f93-46d7-b52d-1c278be463c9
# ╠═3b8bfc96-ad4f-4158-ac00-0ac3ca4168d4
# ╠═34afd85a-d207-4594-8f34-a1d755af5f4e
# ╟─302bff22-427a-4124-8504-b2ffc23fe0f9
# ╠═a92fb6c1-7438-450e-9944-35a3b081d929
# ╠═1322f90d-f3fa-48be-a6c0-c53719b9d1b0
# ╟─12d24fcb-ac05-4571-84fa-6e8cb4518be9
# ╠═e2db0db4-b1a9-4719-b286-f2534caf9cf6
# ╟─0c43323c-7429-4efa-97d2-4ffd0d3e080e
# ╠═dedcd707-7006-4aee-8a98-4555de8abf79
# ╟─3af292c8-ad77-4647-b3ef-052ab0f27958
# ╠═6967daa6-22e5-4e31-8fe4-6db425196767
# ╟─11a32064-a71d-4848-a206-c4d10a21dcce
# ╠═c39614fe-a296-4c24-b280-3f47b6f166be
# ╟─e9825754-b1df-4a40-ae5b-be2ec18319a7
# ╠═e12c4612-5f13-4cfd-aa39-3fea59369ec6
# ╟─4008ebe6-5fbb-4537-b1e5-aa2825a995c4
# ╠═b318072e-3bbd-401a-b1e9-c2b44e0193eb
# ╠═17e02f77-29b9-4b2f-bdd2-ea92d4af061f
# ╟─d15e57a4-525e-480b-b0b7-a64dde0b822c
# ╠═6bfd5cda-cb7d-4e42-b2ee-9f300842b32e
# ╟─393bf9ec-47dc-4f1c-a32e-c7ba79fd6cbb
# ╠═5d20d615-8ed2-4dfe-b5cd-ebd05021e804
# ╠═7040d8bc-7be3-486f-9044-a551d3f9dc36
# ╠═525efd81-d791-4dc7-8197-f31d5d349614
# ╟─d3bbf8a2-2b55-4da4-84de-1bbb91034f72
# ╠═e7f3f8d0-d267-4034-9458-bbfe04eba9bb
# ╠═3dd8fdf7-a377-4707-9daf-d7316b3b0a81
# ╟─a1d1b759-14e3-4257-9a2a-25685e440be4
# ╠═9ab3b30b-8568-4d51-8117-096cf4022df7
# ╠═e822aace-5625-44d4-9a45-d7315c1a3c2d
# ╠═1bef8c16-f9a4-4943-8d2c-7e7e3f0b83d5
# ╟─739a344c-e4d4-4a56-83a0-5a908c12e9c5
# ╠═76f5a002-dcfa-4b12-9925-1791a647f198
# ╠═98164b38-75b5-4795-b4ea-8c651148bf38
# ╠═af820f0a-edeb-4078-9e08-7ce27ee81acf
# ╟─09190732-e098-41f5-a49a-1a59e6877a7c
# ╠═0043b05b-cd56-4434-9ccd-953e26408729
# ╟─b625696b-b6cc-4880-8334-3f2ecc48285f
# ╠═8431135c-a504-4e5d-9533-7d746ae8194d
# ╠═ddd6b5b8-fce6-4ff1-b267-c7de331bb0fa
# ╟─71ee3093-a385-40d4-9a54-805b9cbbe415
# ╠═d1d4e9db-580e-4f05-b20e-02e91913162f
# ╠═0233b860-07fd-4049-8419-d50521604d12
# ╠═60cae1f1-7e98-4044-b8cf-0270247e9672
# ╟─9c912014-5f1c-4c48-9573-ca82098bcc6c
# ╠═7b09a073-decc-4c1c-9a7c-06fcb63e4641
# ╟─d98f015e-c224-4705-830c-4da2c0d28e44
# ╠═939e2684-ce44-4d57-bd16-ec10d0a4183e
# ╠═3bef023a-a141-44dd-942f-5334eda26bdc
# ╟─244e012a-b45a-451c-9b8a-b2622c6f928c
# ╟─532c2e54-4204-4dcc-88a5-8591cd0b0ca5
# ╠═25b7b491-0dc5-4c61-a98c-d7a0dab7ea3b
# ╟─2627af37-6ace-469e-992b-ea7ab35bc8c5
# ╠═8dac60ac-5e2a-4d40-a5b4-726b8ced3e72
# ╟─f1023faa-ea32-41b9-ba2c-7c0c41321fc7
# ╠═bb9a2bd4-5a94-4fe1-ae09-f9a62eb387d9
# ╟─41815fb9-9d6e-419b-a4c5-e6f9e3d26b2f
# ╠═5b11eba4-3be8-4be4-99d5-854eda34002d
# ╟─3156fe5c-e2bd-4989-ae4a-b0161b5814fe
# ╠═95aa016d-cac0-4652-b946-b26195728dde
# ╠═a97d8aff-ec45-4ad1-aa3c-742dd42a25fe
# ╟─f97cb57b-8a91-4e78-9895-f082541acead
# ╠═642826e2-76a8-4afa-9dd2-4445640dde52
# ╟─7df3757d-5aeb-4961-a7f8-2522179e9ad9
# ╟─e4717fec-3888-4739-8bf8-7f29b6f3867e
# ╟─7e5bd743-d2cd-4568-892e-8cc082a46f18
# ╠═bdb34b79-18f1-4a5d-a355-371dcf09a282
# ╟─db92f904-896d-42a5-b32f-b9ef93e552e0
# ╠═b54d281a-4d0f-4a9e-acfa-2cf877df81e1
# ╠═e4582502-ac71-43f6-a439-84b564e4b7c4
# ╟─273c7bb1-8d4a-4476-9c25-f0e0a9481e03
# ╠═b0beb926-67c7-4478-a153-320621ab8483
# ╟─0ab10a88-4551-4177-aeb5-0d6841db037e
# ╠═41c29081-a62f-4944-bb28-e3d55353656d
# ╟─56314eb8-ce75-4348-8682-b37cee918c23
# ╠═7fa88865-3a70-4c84-a5e9-d8b207d1f8d4
# ╟─6002b050-2d81-48a0-af1b-c66c33f1cf2c
# ╟─20221034-f548-404d-8b0d-b7cb55ac5223
# ╟─aa96aebe-94e7-4aaf-9c23-dd244df07623
# ╟─0f367f9f-dc9e-4356-8417-f38cc019e341
# ╟─88921dbf-52c8-4aef-9350-597da5459d5c
# ╟─604cc63e-01d2-4902-8d4d-e607aaf4ed77
# ╟─f1d171e8-ebc0-460d-8cb8-cd2bf4e1e5d4
# ╠═436bc81c-4b79-4493-a890-93c1ab383c4b
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
