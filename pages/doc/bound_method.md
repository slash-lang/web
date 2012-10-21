# BoundMethod

**extends [`Method`](/index.sl/doc/method)**

Represents a [`Method`](/index.sl/doc/method) object that has been bound to a particular receiver. `BoundMethod` objects may be called without specifying a receiver.

## #unbind

Returns a [`Method`](/index.sl/doc/method) without a binding to any receiver.

    1.method("+").unbind;
      # => #<Method:0xdeadbeef>

## #call(args...)

Calls the method represented by the `BoundMethod` instance with the arguments specified by `args`

    method("print").call(1, 2, 3);
      # => 123
