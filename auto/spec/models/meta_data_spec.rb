require 'spec_helper'

describe MetaData do
  it 'should be valid' do
    obj = MetaData.new(org_id:100, obj_name: 'obj1', is_active: true)
    errors = MetaData.get_errors(obj)
    errors[Auto::MSG::Model::RESPONSE][0].should eq Auto::MSG::Model::MSG[:OK]
    obj.save.should be_true
    MetaData.by_name(100,'obj1').length.should eq 1
    MetaData.by_name(100,'obj1').page(1,10).length.should eq 1
    obj.delete
  end
end
