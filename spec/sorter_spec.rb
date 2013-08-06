require 'rspec'
require './sorter'

include RSpec::Matchers

# include Sorter

describe Sorter do

	context 'initialized' do

		subject { Sorter.new }

		it {should_not be_nil}

		specify { subject.values.should_not be_nil }

		it 'should successfully sort by quicksort' do
			subject.sort_by({method: :quick})
			subject.should be_sorted
		end

		it 'should successfully sort by mergesort' do
			subject.sort_by({method: :merge})
			subject.should be_sorted
		end

		it 'should successfully sort by bubblesort' do
			subject.sort_by({method: :bubble})
			subject.should be_sorted
		end
	end
end