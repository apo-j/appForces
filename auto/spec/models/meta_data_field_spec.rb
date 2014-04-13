require 'spec_helper'

describe MetaDataField do
  it 'should be valid' do
    field = MetaDataField.new(org_id:100,field_name:'field1',field_num:1, field_type:1, is_indexed:true, is_unique: false)
    obj = MetaData.new(org_id:100, obj_name: 'obj1', is_active: true)
    field.obj = obj
    field.valid?.should be_true
    obj.valid?.should be_true
    obj.save.should be_true
    obj.fields<<field
    field.persisted?.should be_true
    MetaDataField.all_fields.by_obj_id(obj.obj_id).length.should be >0
    obj.delete
  end
end
