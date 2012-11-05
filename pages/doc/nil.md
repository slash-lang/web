# Nil

**extends [`Object`](/index.sl/doc/object)**

## #to_s

Returns an empty string.

    nil.to_s;
      # => ""

## #inspect

Returns the string `"nil"`.

    nil.inspect;
      # => "nil"

## #==(other)

Returns `true` if `other` is also `nil`.

    nil == nil;
      # => true
    
    nil == false;
      # => false
    
    nil == Nil.new;
      # => true
