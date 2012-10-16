# String

**extends [`Comparable`](/index.sl/doc/comparable)**

Strings in Slash are an immutable sequence of UTF-8 characters. Incoming data in other encodings is converted to UTF-8 before the string is created.

Strings are not suitable for storing binary data. For such use cases, please use a [`Buffer`](/index.sl/doc/buffer) instead.

## #length

Returns the String's length in characters (as opposed to the length in bytes).

    "hello world".length;
      # => 11
      
    "∫ πt dt".length;
      # => 7

## #concat(other), #+(other)

Concatenates the receiver and the argument and returns a new String.

    "foo".concat("bar");
      # => "foobar"
    
    "123" + "456";
      # => "123456"

## #*(times)

Repeats the receiver the specified number of times and returns a new String. The `times` argument must be an [`Int`](/index.sl/doc/int).

Throws [`ArgumentError`](/index.sl/doc/argument_error) if the resulting String is too long.

    "." * 5;
      # => "....."
     
    "nothing" * 0;
      # => "";

## #to_s

Returns the receiver.

    "str".to_s;
      # => "str"

## #to_i

Attempts to convert the receiver to an integer, returning either [`Int`](/index.sl/int) or [`Bignum`](/index.sl/bignum). Ignores leading whitespace and stops parsing at the first non-digit character.

Returns 0 if unsuccessful.

    "123".to_i;
      # => 123
      
    "    456".to_i;
      # => 456
     
    "not an integer".to_i;
      # => 0

## #inspect

Returns a quoted and escaped representation of the receiver.

    "".inspect;
      # => "\"\""
    
    "\\".inspect;
      # => "\"\\\\\""

## #html_escape

Replaces potentially dangerous characters in the receiver with HTML entities and returns a new String.

    "<script>".html_escape;
      # => "&lt;script&gt;"
    
    "&lt;".html_escape;
      # => "&amp;lt;"

## #url_decode

Decodes percent encoded characters and `+` characters in the receiver into their original form and returns a new String.

    "hello%20world".url_decode;
      # => "hello world"
    
    "space+separated".url_decode;
      # => "space separated"

## #url_encode

Encodes non-URL-safe characters in the receiver into their percent encoded form. Encodes space characters as `%20`.

    "url encoded!".url_encode;
      # => "url+encoded%21"

## #index(substring)

Returns the first occurrence of `substring` in the receiver as a character offset, or `nil` if `substring` was not found.

    "one two three".index(" ");
      # => 3
    
    "one two three".index("four");
      # => nil

## #\[](index)

Returns the `index`'th character in the receiver as a String of length 1. If `index` is negative, this method will count backwards from the end of the receiver.

Returns `nil` on an out of bounds index.

    "1234566789"[3];
      # => "4"
    
    "一二三四五六七八九"[-4];
      # => "六"
      
    "out of bounds"[100];
      # => nil

## #split(delimiter = `" "`)

Splits the receiver by `delimiter` and returns an [`Array`](/index.sl/doc/array) of the individual pieces.

If `delimiter` is an empty string, this method returns all the characters in the receiver as individual strings.

    "slash is awesome!".split;
      # => ["slash", "is", "awesome"]
    
    "slash".split("");
      # => ["s", "l", "a", "s", "h"]

## #==(other)

Performs a byte-for-byte equality check of the receiver and `other`.

This method will exit at the earliest possible opportunity and as such is not secure against timing attacks.

    "yes" == "no";
      # => false
      
    "equal" == "equal";
      # => true

## #<=>(other)

Performs a byte-for-byte comparison of the receiver and `other`.

Returns `0` if the two strings are equal, `-1` if the first differing byte in receiver is less than that of `other`, and `1` vice versa.

This method will exit at the earliest possible opportunity and as such is not secure against timing attacks.

    "a" <=> "b";
      # => -1
    
    "a" <=> "B";
      # => 1

## #hash

Returns the hash of the receiver. The return value is guaranteed to be the same for equal strings, but not between different Slash VMs.

## #%(other), #format(other...)

Performs `SPRINTF(3)` style interpolation of the arguments into the receiver.

If the argument to `#%` is an [`Array`](/index.sl/doc/array), the elements are treated as individual values to be interpolated.

At the moment, only the `%s` format specifier is supported.

    "Hello %s" % "world";
      # => "Hello world"
    
    "%s + %s = %s".format(1, 2, 3);
      # => "1 + 2 = 3"