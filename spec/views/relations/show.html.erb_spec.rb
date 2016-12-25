require 'rails_helper'

RSpec.describe "relations/show", type: :view do
  before(:each) do
    @relation = assign(:relation, Relation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
