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

	attr_reader :text, :lines, :words

	def initialize(opts = {})
		@text = opts[:text] ? opts[:text] : BreakingBad::DEFAULT_TEXT
		@words = Hash.new
		@lines = Array.new
	end

	def breaking_badify
		@lines = @text.split(/\r?\n/)
		
		@lines.each do |line|
			line = line.split()
			line_hash = Hash[line.map {|x| [x, Array.new]}]
			@words = BreakingBad::merge_recursively(@words, line_hash)
		end
		
	end
end

