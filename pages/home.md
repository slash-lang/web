# The Slash Programming Language

Slash is a new programming language for the web. It is mainly inspired by Ruby and PHP, with hints of Python and Perl. 

PHP is a great tool that is virtually unmatched in its domain - ie. 'slap a script on a server and have it run'. The problem is that PHP's idiosyncrasies make it awkward and sometimes even painful to program in.

Slash combines PHP's simple execution model with the elegance of Ruby's object model. The result is a language that lets you achieve results quickly while being a joy to use.

## Source code

The Slash project is available on GitHub: [https://github.com/slash-lang/slash](https://github.com/slash-lang/slash)

## Overview

    <%
        db = MySQL.new("localhost", "my-user", "s3cr3t");
        db.use("my-database");
    %>
    <h1>People</h1>
    <ul>
        <% for person in db.query("SELECT * FROM people WHERE location = ?", "Melbourne") { %>
            <li><%= person["name"] %></li>
        <% } else { %>
            <li><em>No people found!</em></li>
        <% } %>
    </ul>

## Features

* **Singleton methods**

      obj = Object.new;
      def obj.foo {
          1 + 2;
      }
      print(obj.foo); # => 3

* **Yada-yada operator**

      def solve_halting_problem {
          ...;
      }
      solve_halting_problem(); # !! NotImplementedError

* **Unicode friendly**

      print("你好世界".length); # => 4
      
      print("åéîøü".upper); # => ÅÉÎØÜ

* **Destructuring assignment**

      def what {
          "switcheroo old the".split(" ");
      }
      [c, b, a] = what();
      print(a, b, c); # => the old switcheroo

* **Lambda expressions**

      def foo(callable) {
          callable.call(9);
      }
      
      print(foo(\x { x * x }), "\n"); # => 81
      
      print(foo(λ x . x ** x), "\n"); # => 387420489

* **Method binding syntax**

      print([1, 2, 3, 4].map(2:*)); # => [2, 4, 6, 8]

* **Everything is an expression**

      obj = class X {
          print(def to_s {
              if false {
                  "nope";
              } else {
                  "an instance of X";
              }
          }, "\n"); # => #<Method:0xdeadbeef>
      }.new;
      print(obj); # => an instance of X

* **Regular expression literals**

      md = %r{It's (?<weather>\w+) in (?<city>\w+)}.match("It's raining in Melbourne");
      print(md["city"], ": ", md["weather"]); # => Melbourne: raining

* **Functional enumerable manipulation**

      print((1..100)
            .filter(\x { x % 2 == 0 })
            .map(\x { x * x })
            .reduce(\(a, b) { a + b })); # => 171700

* **Postfix conditionals**

      print("hello") if true;        # => hello
      print("goodbye") unless false; # => goodbye
      
* **HTML escaping by default**

      Username: <%= user.username %> <!-- => Username: &lt;script&gt;alert(&quot;xss&quot;)&lt;/script&gt; -->

* **Raw output if you really need it**

      <%!! render_markdown(doc.source) %> <!-- => <b>hello world</b> -->

* **Compound and conditional assignment**

      x = 3;
      x *= 2;
      x += 1;
      print(x); # => 7
      
      @cache ||= expensive_operation();

* **Automatic bignum promotion**

      x = 100;
      print(x, " :: ", x.class, "\n"); # => 100 :: Int
      x *= 1000;
      x *= 10000;
      x *= 100000;
      x *= 1000000;
      print(x, " :: ", x.class, "\n"); # => 100000000000000000000 :: Bignum

* **Operator overloading and magic methods**

      class Dots {
          def init(count) {
              @dots = "." * count;
          }
          
          def to_s {
              @dots;
          }
          
          def count {
              @dots.length;
          }
          
          def +(other) {
              Dots.new(self.count + other.count);
          }
          
          def succ {
              self + Dots.new(1);
          }
          
          def <=(other) {
              self.count <= other.count;
          }
      }
      
      three = Dots.new(3);
      five = Dots.new(5);
      print(three + five, "\n"); # => ........
      
      print((three..five).join("; ")); # => ...; ....; .....

* **Exception stack frames are objects**

      def bar {
          throw Error.new;
      }
      
      def foo {
          bar();
      }
      
      try {
          foo();
      } catch e {
          for frame in e.backtrace {
              print(frame.method, " ", frame.file, ":", frame.line, "\n");
          }
      }
      
