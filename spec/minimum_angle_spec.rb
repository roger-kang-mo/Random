require 'rspec'
require './MinimumAngle'

describe MinimumAngle do
	subject { MinimumAngle.new() }

	expect{ MinimumAngle.new(1,2,3,4) }.to raise_error(ArgumentError)

	specify { subject.hour.should == 0 }
	specify { subject.min.should == 0 }

	context 'initialized without values' do
		it 'should set time to 6:15' do
			subject.set_hour(6)
			subject.set_min(15)

			subject.hour.should == 6
			subject.min.should == 15
		end

		it 'should set min_angle to 0' do
			subject.determine_min_angle()
			subject.min_angle.should == 0
		end

		it 'should set min_angle to 180 when given 6:00' do
			subject.set_hour(6)
			subject.min_angle.should == 180
		end

		it 'should set min_angle to 75 when given 3:30' do 
			subject.set_time(3,30)
			subject.min_angle.should == 75
		end

		it 'should set min_angle to 144 when given 7:12' do
			subject.set_time(7,12)
			subject.min_angle.should == 144
		end

	end
end