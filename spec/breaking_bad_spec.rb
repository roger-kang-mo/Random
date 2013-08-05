require 'rspec'
require './breaking_bad'

include RSpec::Matchers

describe BreakingBad do
	
	context 'initialized' do
		subject { BreakingBadalyzer.new }

		it { should_not be_nil }

		specify { subject.text.should_not be_nil }
		specify { subject.text.should == "Breaking\n    Bad\nCreated by\n   Vince Gilligan"}
	end

	context 'with custom text' do
		subject { BreakingBadalyzer.new({ text: "Excess like this that's\ndestroying the plastic rainforest."})}
		before do
			subject.generate_badified
		end
		
		specify { subject.text.should == "Excess like this that's\ndestroying the plastic rainforest." }
		specify { subject.lines.length.should == 2 }

		it 'should generate a new badified text' do
			current_badified = subject.last_badified_text
			subject.generate_badified
			current_badified.should_not eq(subject.last_badified_text)
		end

		it 'should only replace one set of characters in a line' do
			lines = subject.last_badified_text.split(/\r?\n/)
			num_brackets = 0
			lines.each { |line| num_brackets += line.count('[') }

			lines.length.should == num_brackets
		end
	end
end