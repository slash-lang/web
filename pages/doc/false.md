# False

**extends [`Object`](/index.sl/doc/object)**

## #to_s, #inspect

Returns the string `"false"`.

    false.to_s;
      # => "false"
  
    false.inspect;
      # => "false"

## #==(other)

Returns `true` if `other` is also `false`.

    false == false;
      # => true
    
    false == nil;
      # => false
    
    false == False.new;
      # => true
