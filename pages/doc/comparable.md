# Comparable

**extends [`Object`](/index.sl/doc/object)**

Comparable provides the implementations of a set of relational operators. It requires that classes inheriting it implement the spaceship operator (`<=>`).

## #<(other)

Calls `#<=>` on the receiver and returns `true` if the comparison returns a negative integer.

    1 < 2;
      # => true
      
    2 < 2;
      # => false

## #<=(other)

Calls `#<=>` on the receiver and returns `true` if the comparison returns a zero or a negative integer.

    1 <= 2;
      # => true
    
    2 <= 2;
      # => true

## #>(other)

Calls `#<=>` on the receiver and returns `true` if the comparison returns a positive integer.

    2 > 1;
      # => true
    
    2 > 2;
      # => false

## #>=(other)

Calls `#<=>` on the receiver and returns `true` if the comparison returns a zero or a positive integer.

    2 >= 1;
      # => true
    
    2 >= 2;
      # => false