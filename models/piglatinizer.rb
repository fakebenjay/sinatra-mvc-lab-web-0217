class PigLatinizer
  attr_reader :phrase

  VOWELS = ['a', 'e', 'i', 'o', 'u']

  def piglatinize(word)
    array = word.split(//)
    if VOWELS.include?(array[0].downcase)
      array.join << "way"
    else
      while !VOWELS.include?(array[0].downcase)
        array.push(array.shift)
      end
      array.join << "ay"
    end
  end

  def to_pig_latin(phrase)
    array = phrase.split
    arrayway = array.collect {|w| piglatinize(w)}
    arrayway.join(" ")
  end
end
