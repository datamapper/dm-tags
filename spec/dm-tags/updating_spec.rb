require 'spec_helper'

describe "Tag", "when updating" do
  supported_by :sqlite, :mysql, :postgres do
    before do
      @tagged_model = TaggedModel.new
    end

    it "should create itself" do
      @tagged_model.tag_list = "abc, def, ghi"
      @tagged_model.skill_list = "Casablanca, Morocco"
      @tagged_model.save.should be(true)
      @tagged_model.should be_saved

      @tagged_model.reload
      @tagged_model.tags.map { |t| t.name }.should == %w[ abc def ghi ]
      @tagged_model.skills.map { |t| t.name }.should == %w[ Casablanca Morocco ]
    end

    it "should update itself" do
      @tagged_model.save.should be(true)
      @tagged_model.should be_saved

      @tagged_model.reload
      @tagged_model.tags.should be_empty
      @tagged_model.skills.should be_empty

      @tagged_model.tag_list = "abc, def, xyz, jkl"
      @tagged_model.skill_list = "Sahara, Morocco"
      @tagged_model.save.should be(true)

      @tagged_model.reload
      pending do
        @tagged_model.tags.map { |t| t.name }.should == %w[ abc def jkl xyz ]
      end
      @tagged_model.skills.map { |t| t.name }.should == %w[ Morocco Sahara ]

      @tagged_model.tag_list = ""
      @tagged_model.skill_list = ""
      @tagged_model.save

      @tagged_model.tags.should == []
      @tagged_model.skills.should == []
    end
  end
end
