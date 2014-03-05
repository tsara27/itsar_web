require 'spec_helper'

describe TMenu do
	let(:menu) { TMenu.new(:menu_name => "Profile", :url => "/profile/", :visible_to => ",1,2,3,",:t_user_id => 1) }

	it 'is valid' do
		expect(menu).to be_valid  
	end
		
end