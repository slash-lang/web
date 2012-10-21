# Class

**extends [`Object`](/index.sl/doc/class)**

All classes in Slash are instances of the class `Class`. `Class` is therefore an instance of itself. As classes are objects, methods known as *static methods* in other languages are actually singleton methods (methods defined only on a single object) on particular `Class` instances in Slash.

## #to_s, #inspect

Returns the fully qualified name of the receiver.

    Object.to_s;
      # => "Object"
    
    Regexp::Match.to_s;
      # => "Regexp::Match"

## #name

Returns the unqualified name of the receiver.

    Object.to_s;
      # => "Object"
    
    Regexp::Match.to_s;
      # => "Match"

## #in

Returns the `Class` the receiver was defined inside. As classes are just objects, any `Class` object may be accessible in many ways. This method just returns the `Class` in lexical scope when the receiver was first defined.

    Object.in;
      # => nil
      
    Regexp.in;
      # => Object
    
    Regexp::Match.in;
      # => Regexp

## #super

Returns the superclass of the receiver, or the `Class` the receiver extends.

    Object.super;
      # => nil
    
    Class.super;
      # => Object
    
    Array.super;
      # => Enumerable

## #new

Allocates a new object of the class represented by the receiver, calls `#init` on the new object and then returns it.

    Object.new;
      # => #<Object:0xdeadbeef>
    
    String.new;
      # => ""

## #instance_method(name)

Looks up a [`Method`](/index.sl/doc/method) named `name` in the receiver's instance method table. If such a method is not found, the instance method tables of all superclasses are consulted. Finally, if no method is found in any superclass, returns `nil`.

    String.instance_method("concat");
      # => #<Method:0xdeadbeef>
      
    String.instance_method("send");
      # => #<Method:0xdeadbeef>
    
    String.instance_method("nope");
      # => nil

## #own\_instance_method(name)

Looks up a [`Method`](/index.sl/doc/method) named `name` in the receiver's instance method table. If such a method is not found, returns `nil`.

    String.instance_method("concat");
      # => #<Method:0xdeadbeef>
  
    String.instance_method("send");
      # => nil

    String.instance_method("nope");
      # => nil

## #instance_methods

Returns all instance methods in the receiver's instance method table and the instance method tables of all superclasses.

    Int.instance_methods;
      # => ["<=>", "~", "&", "**", "-", "to_s", "/", "negate", "==", "to_f", "+", "to_i", "pred", "inspect", "^", "|", "%", "*", "ordinalize", "succ", ">=", ">", "<=", "<", "own_method", "is_an", "exit", "method", "hash", "rand", "to_s", "print", "require", "==", "methods", "send", "responds_to", "class", "inspect", "is_a", "own_methods", "!="]

## #own\_instance_methods

Returns only the instance methods in the receiver's instance method table.

    Int.own_instance_methods;
      # => ["<=>", "~", "&", "**", "-", "to_s", "/", "negate", "==", "to_f", "+", "to_i", "pred", "inspect", "^", "|", "%", "*", "ordinalize", "succ"]
