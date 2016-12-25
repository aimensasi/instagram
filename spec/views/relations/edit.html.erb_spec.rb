require 'rails_helper'

RSpec.describe "relations/edit", type: :view do
  before(:each) do
    @relation = assign(:relation, Relation.create!())
  end

  it "renders the edit relation form" do
    render

    assert_select "form[action=?][method=?]", relation_path(@relation), "post" do
    end
  end
end
