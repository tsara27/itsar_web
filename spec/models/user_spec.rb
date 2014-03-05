require 'spec_helper'

describe TUser do
	let(:user) { TUser.new(:nme => "Adam Joe", :usrnme => "doejohn", :passwd =>  Base64.encode64("1234joe"), :mail => "joe@doe.com", :t_user_id => 1, :gndr => 1, :t_usertype_id => 1, :t_itsar_id => 2) }

	it 'is valid' do
		expect(user).to be_valid  
	end
		
end