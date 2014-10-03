Pattern matching for Ruby! [![Build Status](https://secure.travis-ci.org/alanszp/patternMatching.png?branch=master)](http://travis-ci.org/alanszp/patternMatching)

Accepts: 
- _ which represents Any.
- An object that understands ==
- type(AClass) which compare the object class
- hierarchy(AClass) which compare to the whole hierarchy of the object
- condition { |object| object > 2 }. The block must return a boolean. If the block throws an Exception, its considered to be false.
