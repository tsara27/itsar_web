require 'spec_helper'

describe TUsertype do
	let(:usertype) { TUsertype.new(:utypename => "Ripea", :t_user_id => 1) }
	

	before(:each) do
	  @utype = TUsertype.new(:utypename => "Ripaa", :t_user_id => 1)
	  @utype.save
	end

	it 'is valid' do
		expect(usertype).to be_valid  
	end

	it 'is invalid without utypename' do
		usertype.utypename = nil
		expect(usertype).not_to be_valid
	end

	it 'is invalid without utypename' do
		usertype.utypename = nil
		expect(usertype).not_to be_valid
	end

	it 'is invalid without matching regex' do
		usertype.utypename = "asd!23"
		usertype.utypename.should_not match(/^([a-z ])+$/i)
		expect(usertype).not_to be_valid
	end

	it 'is invalid with length less than 3' do
		usertype.utypename = "ag"
		expect(usertype.utypename.length).to have_at_least(3).have_at_most(25)
		expect(usertype).not_to be_valid
	end

	it 'is invalid with length more than 25' do
		usertype.utypename = "qwqwqwqwqwqwqwqwqwqwqwqwqghjgh"
		expect(usertype.utypename.length).to have_at_least(3).have_at_most(25)
		expect(usertype).not_to be_valid
	end
	
	it 'is invalid when usertype name already taken' do
		aaa = TUsertype.create(:utypename =>"Ripaa")
		should validate_uniqueness_of(:utypename)
    	expect(aaa).not_to be_valid 	
	end
	
end