# This emulates the credits on Breaking Bad where they show text with
# elements in place of letters.
# E.g. Breaking Bad 			[Br]eaking Bad
# 		Created by 				  Crea[Te]d by
# 		Vince Gilligan  		  Vin[Ce] Gilligan
#


module BreakingBad
	SYMBOLS = ["Ac","Ag","Al","Am","Ar","As","At","Au","B","Ba","Be","Bh","Bi",
       "Bk","Br","C","Ca","Cd","Ce","Cf","Cl","Cm","Cn","Co","Cr","Cs",
       "Cu","Db","Ds","Dy","Er","Es","Eu","F","Fe","Fl","Fm","Fr","Ga",
       "Gd","Ge","H","He","Hf","Hg","Ho","Hs","I","In","Ir","K","Kr","La",
       "Li","Lr","Lu","Lv","Md","Mg","Mn","Mo","Mt","N","Na","Nb","Nd","Ne",
       "Ni","No","Np","O","Os","P","Pa","Pb","Pd","Pm","Po","Pr","Pt","Pu",
       "Ra","Rb","Re","Rf","Rg","Rh","Rn","Ru","S","Sb","Sc","Se","Sg","Si","Sm",
       "Sn","Sr","Ta","Tb","Tc","Te","Th","Ti","Tl","Tm","U","Uuo","Uup","Uus","Uut",
       "V","W","Xe","Y","Yb","Zn","Zr"]

    DEFAULT_TEXT = "Breaking\n    Bad\nCreated by\n   Vince Gilligan"

    def self.merge_recursively(a, b)
	  a.merge(b) {|key, a_item, b_item| BreakingBad::merge_recursively(a_item, b_item) }
	end
end

class BreakingBadalyzer

	attr_reader :text, :lines, :words, :last_badified_text

	def initialize(opts = {})
		@text = opts[:text] ? opts[:text] : BreakingBad::DEFAULT_TEXT
		@words = Hash.new
		@lines = Array.new

		breaking_badify
	end

	def generate_badified
		output = @text.dup

		@lines.each do |line|
			words_in_line = line.split()
			not_replaced = true
			while not_replaced
				word_to_replace = words_in_line[rand(words_in_line.length)]
				if @words[word_to_replace]
					random_combo = @words[word_to_replace][rand(@words[word_to_replace].length)]
					output[word_to_replace] = random_combo
					not_replaced = false
				end
			end
		end
		@last_badified_text = output
	end

	private
	def breaking_badify
		@lines = @text.split(/\r?\n/)

		get_combinations = Proc.new do |word|
			combos = Array.new
			BreakingBad::SYMBOLS.each do |elem|
				word_downcase = word.downcase
				elem_downcase = elem.downcase

				if word_downcase.include? elem_downcase
					end_index = word_downcase.index(elem_downcase) + elem.length
					new_combo = word.dup
					new_combo [word_downcase.index(elem_downcase)...end_index]  = "[#{elem}]" 
					combos << new_combo
				end
			end

			[word, combos]
		end

		@lines.each do |line|
			line = line.split()

			line_hash = Hash[line.map { |word| get_combinations.call(word)}]

			@words = BreakingBad::merge_recursively(@words, line_hash)
		end
	end
end

