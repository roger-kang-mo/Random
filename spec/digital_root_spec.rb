require 'rspec'
require './digital_root'

describe DigitalRoot do

	context 'initialized' do
		subject { DigitalRoot.new }

		it { expect(subject.get_root(0)).to eq(0) }
		it { expect(subject.get_root(1)).to eq(1) }
		it { expect(subject.get_root(10)).to eq(1) }
		it { expect(subject.get_root(104)).to eq(5) }
		it { expect(subject.get_root(1048)).to eq(4) }
		it { expect(subject.get_root(31337)).to eq(8) }
		it { expect(subject.get_root(198741094)).to eq(7) }
		it { expect(subject.get_root(1289073590182735981729012312837498172903847091823597612893569182736498172630948167209358712351251235)).to eq(4) }
	end
end

