# Error

**extends [`Object`](/index.sl/doc/object)**

Error is the base class for all exceptions in Slash. Only instances of Error or a subclass of Error may be thrown as exceptions.

Standard subclasses of Error in Slash are:

* `ArgumentError`
* `EncodingError`
* `NameError`
* `NoMethodError`
* `StackOverflowError`
* `SyntaxError`
* `TypeError`
* `ZeroDivisionError`
* `NotImplementedError`

As none of these subclasses define any methods of their own, they do not have their own documentation pages.

## #init(message = `nil`)

Initializes the receiver with `message` as the error message. `message` is optional and defaults to `nil`.

## #name

Returns the name of the error.

    Error.new.name;
      # => "Error"
    
    SyntaxError.new.name;
      # => "SyntaxError"

## #message

Returns the error's message.

    Error.new.message;
      # => nil
    
    Error.new("Something bad happened!").message;
      # => "Something bad happened!"

## #backtrace

Returns an [`Array`](/index.sl/doc/array) of [`Error::Frame`](/index.sl/doc/error/frame) objects in inner to outer order.

Note that an Error's backtrace is built lazily when an Error is thrown, so it is not possible to generate a stack trace by simply instantiating an Error instance.

    Error.new.backtrace;
      # => []
    
    def b {
        throw Error.new;
    }
    def a {
        b();
    }
    try {
        a();
    } catch e {
        e.backtrace;
          # => [#<Error::Frame:0xdeadbeef>, #<Error::Frame:0xbadf00d>, #<Error::Frame:0xcafebabe>]
    }

## #to_s

Returns a pretty printed representation of the receiver including information such as name, message and backtrace.

    ArgumentError.new("bad argument").to_s;
      # => "ArgumentError: bad argument\n"

