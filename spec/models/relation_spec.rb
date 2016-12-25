# == Schema Information
#
# Table name: relations
#
#  id           :integer          not null, primary key
#  following_id :integer          not null
#  follower_id  :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Relation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
