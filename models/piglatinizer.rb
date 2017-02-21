class PigLatinizer
  attr_reader :phrase

  VOWELS = ['a', 'e', 'i', 'o', 'u']
  TWO_LETTER_CLUSTERS = ['pl', 'th', 'pr', 'wh', 'sk']
  THREE_LETTER_CLUSTERS = ['spr', 'str']

  def piglatinize(word)
    array = word.split(//)
    if VOWELS.include?(array[0].downcase)
      array.join << "way"
    elsif TWO_LETTER_CLUSTERS.include?(word[0..1].downcase)
      first = array.shift(2).join
      array << first
      array.join << "ay"
    elsif THREE_LETTER_CLUSTERS.include?(word[0..2].downcase)
      first = array.shift(3).join
      array << first
      array.join << "ay"
    else
      first = array.shift
      array << first
      array.join << "ay"
    end
  end

  def to_pig_latin(phrase)
    array = phrase.split
    arrayway = array.collect {|w| piglatinize(w)}
    arrayway.join(" ")
  end
end
