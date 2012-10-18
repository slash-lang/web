# Object

Object is the root class in the Slash class hierarchy. All classes must inherit from either Object or another class.

Object provides a set of common methods that can be expected to be present on all Slash objects.

## #to_s

Returns a string representation of the receiver intended to be used for display purposes. The default implementation returns the result of calling `#inspect` on the receiver.

    123.to_s;
      # => "123"
    
    "123".to_s;
      # => "123"

## #inspect

Returns a string representation of the receiver intended to be used for internal or debugging purposes. The default implementation returns a String containing the class name and memory address of the receiver.

    Object.new.inspect;
      # => "#<Object:0xdeadbeef>"

## #send(method, args...)

Dynamically calls the `method` method on the receiver with `args` as the arguments.

    1.send("+", 2);
      # => 3

## #reponds_to(method)

Determines whether the receiver will respond to `method`. Returns `true` if `method` can be sent to the receiver without throwing a [`NoMethodError`](/index.sl/doc/no_method_error).

    1.responds_to("+");
      # => true
    
    1.responds_to("concat");
      # => false

## #class

Returns the class the receiver is an instance of.

    1.class;
      # => Int
    
    "foo".class;
      # => String

## #is_a(klass)

Determines if the receiver is an instance of `klass`, or an instance of a subclass of `klass`.

    1.is_a(Int);
      # => true
    
    1.is_a(Number);
      # => true
    
    1.is_a(String);
      # => false

## #hash

Returns a hash representing the object. Guaranteed to return the same value for the same object in the same Slash VM. Unless overridden, equal objects residing at different memory locations will likely return different hashcodes.

## #method(name)

Returns a [`BoundMethod`](/index.sl/doc/bound_method) representing the method on the receiver identified by `name`. If there is no such method on the receiver or the receiver's class, this method will consider all superclasses. Returns `nil` if no method is found.

    1.method("+");
      # => #<BoundMethod:0xdeadbeef>

    1.method("method");
      # => #<BoundMethod:0xdeadbeef>

## #own_method(name)

Returns a [`BoundMethod`](/index.sl/doc/bound_method) representing the method on the receiver identified by `name`. This method will only consider singleton methods on the receiver or instance methods on the receiver's immediate class. Superclasses are not searched. Returns `nil` if no method is found.

    1.own_method("+");
      # => #<BoundMethod:0xdeadbeef>
    
    1.own_method("method");
      # => nil

## #methods

Returns an [`Array`](/index.sl/doc/array) of the names of all methods the receiver responds to. This method will return singleton methods, methods on the receiver's class, and all superclass methods.

    1.methods;
      # => ["<=>", "~", "&", "-", "to_s", "/", "negate", "==", "to_f", "+", "to_i", "pred", "inspect", "^", "|", "%", "*", "ordinalize", "succ", ">=", ">", "<=", "<", "own_method", "exit", "method", "hash", "rand", "to_s", "print", "require", "==", "methods", "send", "responds_to", "class", "inspect", "is_a", "own_methods", "!="]

## #own_methods

Returns an [`Array`](/index.sl/doc/array) of the names of all singleton methods on the receiver and all methods on the receiver's class. This method does not consider methods on superclasses of the receiver's class.

    1.own_methods;
      # => ["<=>", "~", "&", "-", "to_s", "/", "negate", "==", "to_f", "+", "to_i", "pred", "inspect", "^", "|", "%", "*", "ordinalize", "succ"]

## #==(other)

Determines if two objects are considered equal. The default implementation returns `true` if and only if the receiver and `other` are identical - ie. they point to the same memory location.

    Object.new == Object.new;
      # => false
    
    a = Object.new;
    a == a;
      # => true

## #!=(other)

Determines if two objects are considered unequal. The default implementation calls `==` on the receiver with `other` as an argument and returns the opposite result. It should not be necessary to redefine `!=` in most cases.

    Object.new != Object.new;
      # => true
    
    o = Object.new;
    def o.==(other) { true; }
    o != "x";
      # => false