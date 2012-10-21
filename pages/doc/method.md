# Method

**extends [`Object`](/index.sl/doc/object)**

`Method` objects are code bound to a particular class, but not bound to any particular receiver. They are not just a representation of a method - Slash uses `Method` objects internally.

## #bind(receiver)

Binds the `Method` object to the receiver given by `receiver` and returns a new [`BoundMethod`](/index.sl/doc/bound_method) instance.

    String.instance_method("+").bind("hello ");
      # => #<BoundMethod:0xdeadbeef>
    
    String.instance_method("+").bind("hello ").call("world");
      # => "hello world"

## #apply(receiver, args...)

Applies the `Method` object to the receiver given by the `receiver` argument and with the arguments given by `args` and returns the result. If this `#apply` is called on a [`BoundMethod`](/index.sl/doc/bound_method), the bound receiver is ignored in favour of the `receiver` argument.

    Int.instance_method("**").apply(2, 4);
      # => 16
    
    0.method("*").apply(3, 3);
      # => 9

## #name

Returns the name of the `Method` object as a [`String`](/index.sl/doc/string). Returns `nil` if the `Method` is uninitialized.

    method("exit").name;
      # => "exit"

## #on

Returns the [`Class`](/index.sl/doc/class) the `Method` is defined on. Objects the `Method` is bound to must be instances of this class or instances of a subclass.

    method("print").on;
      # => Object
    
    SyntaxError.instance_method("message").on;
      # => Error

## #arity

Returns the arity of the `Method`. If the `Method` has a fixed number of arguments, this number will be positive. If the `Method` is variadic, then the number returned will be `-(n + 1)`, where `n` is the minimum number of arguments the `Method` accepts.

    method("print").arity;
      # => -2
    
    "x":+.arity;
      # => 1
