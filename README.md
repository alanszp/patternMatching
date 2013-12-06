Pattern matching for Ruby!

Accepts: 
- _ which represents Any.
- An object that understands ==
- type(AClass) which compare the object class
- hierarchy(AClass) which compare to the whole hierarchy of the object
- condition { |object| object > 2 }. The block must return a boolean. If the block throws an Exception, its considered to be false.
