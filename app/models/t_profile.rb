class TProfile < ActiveRecord::Base
  attr_accessible :id, :shortname_itsar, :self_profile, :t_user_id
  validates :self_profile, :presence => true, :length => { :maximum => 500 }

  belongs_to :t_itsar, :foreign_key =>	 "shortname_itsar", :primary_key => "shortname"
  belongs_to :t_user
end
