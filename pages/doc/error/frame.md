# Error::Frame

**extends [`Object`](/index.sl/doc/object)**

Error::Frame contains information about a stack frame that an exception passed through.

Error::Frame objects can be obtained via the [`Error#backtrace`](/index.sl/doc/error) method.

## #method

Returns the name of the method executing when the `Error::Frame` object was created. This may be either a method name or one of `<main>`, `<parser>` and `<compiler>`.

    e.backtrace[0].method;
      # => "my_method"
    
    e.backtrace[1].method;
      # => "<main>"

## #file

Returns the filename corresponding to this `Error::Frame`. May be either absolute or relative. In the case of a parser or compiler error, this will be the file being parsed/compiled where the error occurred.

## #line

Returns the line number corresponding to this `Error::Frame`. In the case of a parser or compiler error, this will be the line the error occured on.

## #to_s

Returns a pretty printed representation of the receiver including information such as file, line and method.

    e.backtrace[0].to_s;
      # => " at my_method in some_file.sl, line 12"
    
    e.backtrace[1].to_s;
      # => "at <main> in some_file.sl, line 23"