class TProfile < ActiveRecord::Base
  attr_accessible :id, :shortname_itsar, :self_profile, :t_user_id
  belongs_to :t_itsar
end
