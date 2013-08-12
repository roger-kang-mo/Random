require 'rspec'
require './NDivisible'

include RSpec::Matchers

describe NDivisible do 
	context 'initialized' do 
		subject { NDivisible.new() }

		it 'should raise an error when not given anything' do
			expect { subject.get_n_divisible()}.to raise_error(ArgumentError)
		end

		it 'should raise an error when only given one arg' do
			expect { subject.get_n_divisible(1)}.to raise_error(ArgumentError)
		end

		it 'should raise an error when given too many args' do
			expect { subject.get_n_divisible(1,2,3)}.to raise_error(ArgumentError)
		end

		it 'should return no solution when given 0,0' do
			subject.get_n_divisible(0,0).should == 'No solution found.'
		end

		it 'should return 998 when given 3,2' do
			subject.get_n_divisible(3,2).should == 998
		end

		it 'should return 8482550 when given 7,4241275' do
			subject.get_n_divisible(7,4241275).should == 8482550
		end
	end
end