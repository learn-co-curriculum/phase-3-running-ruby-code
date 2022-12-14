# Running Ruby Code

## Learning Goals

- Run Ruby code from a file
- Log output to the terminal
- Run Ruby code from IRB
- Run RSpec tests in Ruby

## Introduction

In this lesson, you'll get some practice running Ruby code, and see a few
different ways to check what your code is doing. Make sure to code along to get
comfortable in this new environment!

## Creating a Ruby Application

Let's dive right in. To get started on any new Ruby application, the first thing
we need is a file. Create a new file in this lab directory called `app.rb`. In
this file, add the following:

```rb
# app.rb
puts "Hello world!"
```

`puts` is a built-in Ruby method that will output a string of text to the
terminal. It's the Ruby equivalent of `console.log()` in JavaScript. It will
print the string "Hello world!" along with a line break at the end.

The line above `puts` is a Ruby comment. In Ruby, any line that starts with a
`#` won't be executed by the interpreter. This is the Ruby equivalent of `//` in
JavaScript.

One important thing to note about Ruby methods that we'll explore further: in
Ruby, using parentheses when invoking a method is optional. You can also write
the above code like this:

```rb
# app.rb
puts("Hello world!")
```

Both of these examples will do the same thing; but for Rubyists, the first
syntax is preferred since it is more pleasant to look at.

## Running Ruby Applications

Unlike JavaScript, you won't be running Ruby applications in the browser.
Instead, you'll need to use the Ruby interpreter to run your code from the
terminal. You can check which version of Ruby you're using with this command:

```console
$ ruby -v
ruby 2.7.3p183 (2021-04-05 revision 6847ee089d) [x86_64-darwin19]
```

To run the application, enter the command `ruby filename.rb`, where
`filename.rb` is the relative path to the file you'd like to run:

```console
$ ruby app.rb
Hello world!
```

Congrats on running your first Ruby application! 🎉

## Ruby Terminal Output Methods

Now that we have a place to write some code, let's explore a few of Ruby's
built-in methods for displaying info in the terminal so you can easily inspect
your code as you are writing it.

### Outputting Strings with `puts` and `print`

Ruby has several methods for printing output to the terminal: `puts`, `print`,
`p`, and `pp`.

`print` and `puts` do almost the same thing; the only difference is that `puts`
will add a line break at the end of the string. Try updating the code in
`app.rb` to the following:

```rb
# app.rb
puts "Hello world!"
puts "Hello world!"
puts "Hello world!"
```

Run the application with `ruby app.rb`. Then change `puts` to `print` and run
it again to see the difference in output:

```rb
# app.rb
print "Hello world!"
print "Hello world!"
print "Hello world!"
```

### Inspecting Data with `p` and `pp`

`puts` and `print` are great for working with strings and displaying them in the
terminal, but it's often helpful to be able to inspect other kinds of data that
aren't so easily represented as strings.

For example, if we had an array and we wanted to inspect it in the console,
`puts` might not be the best way.

```rb
# app.rb
puts [1, 2, 3]
```

When using `puts` on something that isn't already a string, Ruby will coerce the
data to a string by calling the `.to_s` method. In the case of arrays, this will
produce the following output, with each element of the array printed to a new
line in the console:

```console
$ ruby app.rb
1
2
3
```

This is where the `p` method comes in handy:

```rb
# This is the equivalent of calling:
# puts [1, 2, 3].inspect
p [1, 2, 3]
```

The `p` method will output the data in a nicer format by calling the `.inspect`
method on our data.

```console
$ ruby app.rb
[1, 2, 3]
```

Ruby has one more method, `pp`, for "pretty-printing" complex data, such as
nested arrays and hashes (the Ruby equivalent of a JavaScript object):

```rb
# app.rb
pp [{ id: 1, hello: "World" }, { id: 2, hello: "Ruby" }, { id: 3, hello: "Moon" }, { id: 4, hello: "Learner" }]
```

The `pp` method will "pretty-print" these objects by calling the
`.pretty_inspect` method on our data.

```console
$ ruby app.rb
[{:id=>1, :hello=>"World"},
 {:id=>2, :hello=>"Ruby"},
 {:id=>3, :hello=>"Moon"},
 {:id=>4, :hello=>"Learner"}]
```

## Exploring Ruby with IRB

Ruby comes with a tool called IRB (Interactive Ruby) for running a Ruby REPL
(read-evaluate-print-loop) in the terminal, which provides similar functionality
to the browser console that you're familiar with from JavaScript. Using IRB is a
great way to quickly test out some code, or check your syntax, without needing
to run an entire application.

To use IRB, go into the terminal and enter `irb`:

```console
$ irb
2.7.3 :001 >
```

This gives you a prompt where you can enter Ruby code. Try entering in
`puts "Hello IRB"`:

```console
2.7.3 :001 > puts "Hello IRB"
Hello IRB
 => nil
```

You'll notice that two lines are output: `Hello IRB`, then `=> nil`. The first
line is the output of the `puts` method; the second line is the **return value**
of the `puts` method. IRB indicates that this is the return value with the `=>`
symbol. In Ruby, all methods have a return value. `nil` in this case means "no
value", similar to `null` in JavaScript.

Try running a few more expressions in IRB:

```console
> first_number = 7
 => 7
> first_number
 => 7
> puts first_number
7
 => nil
```

In the code above, we've declared a **local variable** called `first_number` and
assigned it a value of `7`. Note the difference between just entering
`first_number` and entering `puts first_number`: in the first case, the **return
value** is `7`, in the second case, the **return value** is `nil`. Using the
correct return value will become more important once we start writing methods,
so remember: the `puts` method **always returns `nil`**.

> In Ruby, it's convention to use underscores (\_) to separate words in
> variables. This is referred to as **snake case** (as opposed to **camel
> case**, which is the convention in JavaScript).

You can exit IRB by typing `exit`, or pressing `ctrl + d`.

## Running RSpec Tests

All the lessons in the Ruby curriculum use the RSpec library for testing your
Ruby code.

In this lesson, you'll see a `spec` folder with two files, `app_spec.rb` and
`spec_helper.rb`. The `spec_helper.rb` file does a bit of general-purpose setup
for our tests. `app_spec.rb` is where we've defined tests specifically for this
lesson.

RSpec is a Ruby gem (the Ruby equivalent of a npm package) that provides a
domain-specific language, or DSL, that makes it very nice way to write tests.
The RSpec library was installed on your system as part of installing the
`learn-co` gem earlier in the program.

Let's take one of these tests as an example to see RSpec's DSL:

```rb
it 'outputs the string "Pass this test, please." using the print method' do
  expect { load 'app.rb' }.to output(a_string_including("Pass this test, please.")).to_stdout
end
```

All of this is valid Ruby code, but it should read (more or less) like English:

> Expect that loading the `app.rb` file will output a string including the text
> "Pass this test, please." to the terminal's standard output.

Clear out the code in `app.rb` to start from scratch so we can try getting these
tests to pass.

To run the tests, you can use either the `rspec` command or `learn test`. Run
the command, then take a moment to study the output:

```console
$ learn test

the program
  has a file app.rb
  outputs the string "Hello World!" using the puts method (FAILED - 1)
  outputs the string "Pass this test, please." using the print method (FAILED - 2)
  outputs the array [1, 2, 3] using the p method (FAILED - 3)

Failures:

  1) the program outputs the string "Hello World!" using the puts method
     Failure/Error: expect { load 'app.rb' }.to output(a_string_including("Hello World!\n")).to_stdout

       expected block to output a string including "Hello World!\n" to stdout, but output nothing
       Diff:
       @@ -1 +1 @@
       -(a string including "Hello World!\n")
       +""

     # ./spec/app_spec.rb:10:in `block (2 levels) in <top (required)>'

  2) the program outputs the string "Pass this test, please." using the print method
     Failure/Error: expect { load 'app.rb' }.to output(a_string_including("Pass this test, please.")).to_stdout

       expected block to output a string including "Pass this test, please." to stdout, but output nothing
       Diff:
       @@ -1 +1 @@
       -(a string including "Pass this test, please.")
       +""

     # ./spec/app_spec.rb:14:in `block (2 levels) in <top (required)>'

  3) the program outputs the array [1, 2, 3] using the p method
     Failure/Error: expect { load 'app.rb' }.to output(a_string_including("[1, 2, 3]\n")).to_stdout

       expected block to output a string including "[1, 2, 3]\n" to stdout, but output nothing
       Diff:
       @@ -1 +1 @@
       -(a string including "[1, 2, 3]\n")
       +""

     # ./spec/app_spec.rb:18:in `block (2 levels) in <top (required)>'

Finished in 0.04406 seconds (files took 0.28088 seconds to load)
4 examples, 3 failures

Failed examples:

rspec ./spec/app_spec.rb:6 # the program outputs the string "Hello World!" using the puts method
rspec ./spec/app_spec.rb:13 # the program outputs the string "Pass this test, please." using the print method
rspec ./spec/app_spec.rb:17 # the program outputs the array [1, 2, 3] using the p method
```

RSpec provides all kinds of useful information about what went right and wrong
with our code, so make sure to spend your time reading all the output here! It
will tell you:

- Which tests passed/didn't passed
- Why each failing test failed (the difference between the expected output and
  the actual output)
- The line number of the failing test

You can also use the `--fail-fast`, or `--f-f` flag to tell RSpec to stop running
after the first failing test. This technique is helpful for focusing your attention
on one problem at a time:

```console
$ learn test --f-f

the program
  has a file app.rb
  outputs the string "Hello World!" using the puts method (FAILED - 1)

Failures:

  1) the program outputs the string "Hello World!" using the puts method
     Failure/Error: expect { load 'app.rb' }.to output(a_string_including("Hello World!\n")).to_stdout

       expected block to output a string including "Hello World!\n" to stdout, but output nothing
       Diff:
       @@ -1 +1 @@
       -(a string including "Hello World!\n")
       +""

     # ./spec/app_spec.rb:10:in `block (2 levels) in <top (required)>'

Finished in 0.0389 seconds (files took 0.24407 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/app_spec.rb:6 # the program outputs the string "Hello World!" using the puts method
```

## Instructions

To finish this lab, use the `puts`, `print`, and `p` methods in the `app.rb` file
as described by the tests:

- Use `puts` to display the string `"Hello World!"`
- Use `print` to display the string `"Pass this test, please."`
- Use `p` to display the array `[1,2,3]`

Using `learn test` will run the tests and sync your progress with GitHub and
Canvas. When your tests are all passing, the lab is complete!

## Conclusion

This lesson covered a good amount of material, but now you should be familiar
with running code in a Ruby environment, and using tools like IRB and RSpec
as well as built-in methods like `puts` to understand what happens when your
Ruby code is running. You'll need all these tools going forward, so make sure
to get practice with all of them as you progress through this phase!

## Resources

- [Understanding The Differences Between Puts, Print & P](https://www.rubyguides.com/2018/10/puts-vs-print/)
- [Ruby in Twenty Minutes](https://www.ruby-lang.org/en/documentation/quickstart/)
- [RSpec Documentation](https://rspec.info/)
# rewrite-array-methods
