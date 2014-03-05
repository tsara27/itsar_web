require 'spec_helper'

describe TItsar do
	let(:itsar_group) { TItsar.new(:gname => "KRM", :schname => "SMPN 2 Bandung", :t_user_id => 1) }
	

	it 'is valid' do
		expect(itsar_group).to be_valid  
	end
		
end