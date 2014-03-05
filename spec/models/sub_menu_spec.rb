require 'spec_helper'

describe TSubmenu do
	let(:submenu) { TSubmenu.new(:menu_name => "Profile", :url => "/profile/", :visible_to => ",1,2,3,", :t_menu_id => 1, :t_user_id => 1) }

	it 'is valid' do
		expect(submenu).to be_valid  
	end
		
end