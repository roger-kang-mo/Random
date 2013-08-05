require 'rspec'
require './breaking_bad'

include RSpec::Matchers

describe BreakingBad do
	
	context 'initialized' do
		subject { BreakingBadalyzer.new }

		it { should_not be_nil }

		specify { subject.text.should_not be_nil }
	end

	context 'given default text' do
		subject { BreakingBadalyzer.new({ text: "Excess like this that's\ndestroying the plastic rainforest."})}
		before do
			subject.breaking_badify
		end
		
		specify { subject.text.should == "Excess like this that's\ndestroying the plastic rainforest." }
		specify { subject.lines.length.should == 2 }
	end
end