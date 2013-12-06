require_relative '../src/PatternMatching/pattern_matching'
require_relative '../src/Exceptions/match_error'

require 'rspec'

describe 'Test pattern matching' do

  before do
    def factorial(n)
      pattern(n) do
        is(0) { 1 }
        is(condition{|n| n<0}) {"Tiene que ser positivo"}
        is(type(Fixnum)) { n * factorial(n-1) }
        is(_) {"No tiene sentido lo que pasaste: #{n.to_s}"}
      end
    end
  end

  #it 'pasa si ninguno aplica y devuelve exception' do
    #def patternMatchingMethod(x)
    #  pattern(x) do
    #                            ----> No lo puedo testear...
    #  end
    #end

    #expect(patternMatchingMethod(124)).to raise_error(MatchError)
  #end


  it 'pasa si aplica caso base' do
    def patternMatchingMethod(x)
      pattern(x) do
        is(_) {'base'}
      end
    end

    expect(patternMatchingMethod('holas')).to eq('base')
  end

  it 'pasa si aplica caso base, salteandose todos los otros' do
    def patternMatchingMethod(x)
      pattern(x) do
        is(1) { 'uno'}
        is(nil) { 'its nil'}
        is('chau') { 'dijo chau'}
        is(_) {'base'}
      end
    end

    expect(patternMatchingMethod('holas')).to eq('base')
  end


  it 'pasa si aplica en uno de los casos que no es base' do
    def patternMatchingMethod(x)
      pattern(x) do
        is('uno') {'string uno'}
        is(1) { "uno"}
        is(_) {'base'}
      end
    end

    expect(patternMatchingMethod(1)).to eq('uno')
  end

  it 'pasa si aplica en caso de que sea un tipo' do
    def patternMatchingMethod(x)
      pattern(x) do
        is(type(Fixnum)) { "es un fixnum"}
        is(type(String)) { "es un String"}
        is(_) {'base'}
      end
    end

    expect(patternMatchingMethod('foo')).to eq('es un String')
  end


  it 'pasa si aplica en caso de que sea un tipo, mezclando con diferentes tipos y objetos' do
    def patternMatchingMethod(x)
      pattern(x) do
        is(nil) {'its nil'}
        is(1) {'uno'}
        is(type(Fixnum)) { "es un fixnum"}
        is(type(String)) { "es un String"}
        is(_) {'base'}
      end
    end

    expect(patternMatchingMethod('foo')).to eq('es un String')
  end



  it 'pasa si aplica en caso de que sea un tipo' do
    def patternMatchingMethod(x)
      pattern(x) do
        is(type(Fixnum)) { "es un fixnum"}
        is(type(String)) { "es un String"}
        is(_) {'base'}
      end
    end

    expect(patternMatchingMethod('asf')).to eq('es un String')
  end


  it 'pasa si aplica en caso de que sea de una jerarquia' do
    def patternMatchingMethod(x)
      pattern(x) do
        is(hierarchy(Numeric)) { "es uno de la jerarquia numeric!"}
        is(_) {'base'}
      end
    end

    expect(patternMatchingMethod(1)).to eq("es uno de la jerarquia numeric!")
  end

  it 'pasa si aplica en caso de que sea de una jerarquia y tiene varias otras coasas' do
    def patternMatchingMethod(x)
      pattern(x) do
        is(nil) {"the nil"}
        is(3)  {"tres"}
        is(type(String)) { "es un String"}
        is(hierarchy(Numeric)) { "es uno de la jerarquia numeric!"}
        is(_) {'base'}
      end
    end

    expect(patternMatchingMethod(1)).to eq("es uno de la jerarquia numeric!")
  end

  it 'pasas si aplica en la condicion' do
    def patternCondition(x)
      pattern(x) do
        is(condition {|n| n>=0 }) {"es positivo"}
        is(condition {|n| n<0 }) {"es negativo"}
        is(_) {"cualquier cosa"}
      end
    end

    expect(patternCondition(-1)).to eq("es negativo")
  end

  it 'pasa si resuelve factorial recursivo con numero positivo' do
    expect(factorial(4)).to eq(24)
  end


  it 'pasa si resuelve factorial recursivo con 0' do
    expect(factorial(0)).to eq(1)
  end


  it 'pasa si resuelve factorial recursivo con numero negativo' do
    expect(factorial(-51)).to eq("Tiene que ser positivo")
  end


  it 'pasa si resuelve factorial recursivo con numero positivo' do
    expect(factorial('foo')).to eq("No tiene sentido lo que pasaste: foo")
  end


end