# True

**extends [`Object`](/index.sl/doc/object)**

## #to_s, #inspect

Returns the string `"true"`.

    true.to_s;
      # => "true"
  
    true.inspect;
      # => "true"

## #==(other)

Returns `true` if `other` is also `true`.

    true == true;
      # => true
    
    true == 123;
      # => false
    
    true == True.new;
      # => true
