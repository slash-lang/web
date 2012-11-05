# Int

**extends [`Number`](/index.sl/doc/number)**

The `Int` class represents 31-bit signed integers (30 bits of precision + 1 sign bit). If an operation on an `Int` is likely to overflow it will automatically be promoted to a [`Bignum`](/index.sl/doc/bignum).

`Int`s are special in Slash - they may not carry singleton methods or have any instance variables.

## #succ

Returns the successor of the receiver, ie. `self + 1`.

    3.succ;
      # => 4
    
    -1.succ;
      # => 0

## #pred

Returns the predecessor of the receiver, ie. `self - 1`.

    3.pred;
      # => 2
    
    -1.pred;
      # => -2

## #negate

Negates the receiver. This method is called by the unary `-` operator.

    -(3);
      # => -3
    
    -5.negate;
      # => 5

## #+(other)

Adds the receiver to `other` (which may be an `Int`, `Float` or `Bignum`) and returns the result.

    3 + 4;
      # => 7
    
    1 + 0.0;
      # => 1.0

## #-(other)

Subtracts `other` (which may be an `Int`, `Float` or `Bignum`) from the receiver and returns the result.

    3 - 4;
      # => -1
    
    7 - 0.0;
      # => 7.0

## #*(other)

Multiplies the receiver by `other` (which may be an `Int`, `Float` or `Bignum`) and returns the result.

    3 * 4;
      # => 12
      
    9 * 1.0;
      # => 9.0

## #/(other)

Divides the receiver by `other` (which may be an `Int`, `Float` or `Bignum`) and returns the result. If `other` is an `Int` or `Bignum`, integer division is performed. If `other` is a `Float`, floating point division is performed.

    7 / 2;
      # => 3
    
    7 / 2.0;
      # => 3.5

## #%(other)

Divides the receiver by `other` (which may be an `Int`, `Float` or `Bignum`) and returns the **remainder**.

    7 % 2;
      # => 1
    
    7 % 2.0;
      # => 1.0

## #**(other)

Raises the receiver to the `other`th power. May raise `ArgumentError` if the exponent is too large.

    2 ** 8;
      # => 256
    
    16 ** -0.5;
      # => 0.25

## #&(other)

Performs a bitwise-and against `other` (which may be an `Int` or `Bignum`) and returns the result.

    127 & 0;
      # => 0
    
    126 & 15;
      # => 14

## #|(other)

Performs a bitwise-or against `other` (which may be an `Int` or `Bignum`) and returns the result.

    127 | 0;
      # => 127
    
    126 | 15;
      # => 127

## #^(other)

Performs a bitwise-xor against `other` (which may be an `Int` or `Bignum`) and returns the result.

    127 ^ 0;
      # => 127
    
    126 ^ 16;
      # => 113

## #~

Returns the bitwise complement of the receiver.

    ~456;
      # => -457
    
    ~-1;
      # => 0

## #to_s, #inspect

Returns the decimal representation of the receiver as a `String`.

    0.to_s;
      # => "0"
    
    123.inspect;
      # => "123"

## #to_i

Returns the receiver.

    0.to_i;
      # => 0
    
    123.to_i;
      # => 123

## #to_f

Returns the floating point representation of the receiver. All possible values of `Int` are guaranteed to be accurately represented by `Float`.

    0.to_f;
      # => 0.0
    
    123.to_f;
      # => 123.0

## #==(other)

Returns `true` if the receiver is considered equal to `other` (which may be an `Int`, `Float` or `Bignum`)

    0 == 1;
      # => false
    
    3 == 3.0;
      # => true

## #<=>(other)

Compares the receiver with `other` (which may be an `Int`, `Float` or `Bignum`) and returns a negative number if `self < other`, a positive number if `self > other` or zero if `self == other`.

    17 <=> 21;
      # => -1
    
    55 <=> -55
      # => 1
    
    1 <=> 1;
      # => 0

