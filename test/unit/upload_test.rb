require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  
  test "make makes a valid record" do
    r = Upload.make
    assert r.valid?
  end
  
  test "to_s returns attachment_file_name" do
    r = Upload.make
    assert_equal r.attachment_file_name, r.to_s
  end
    
  test "attachment_file_name is unique" do
    r1 = Upload.make
    r2 = Upload.create { |r| r.attachment_file_name = r1.attachment_file_name }
    assert r2.errors.on(:attachment_file_name)
  end
  
  test "should create an upload via (stubbed out) url" do
    Upload.any_instance.expects(:do_download_remote_file).returns(File.open("#{Rails.root}/test/fixtures/files/rails.png"))
    r = Upload.create!(:attachment => nil, :attachment_url => 'rails.png')
    assert_equal 'rails.png', r.attachment_remote_url # check for correct original attachment_url value
    assert_equal 'image/png', r.attachment_content_type # check for correct type
    assert_equal 6646, r.attachment_file_size # check for correct file size
  end
  
  test "should require upload provided via (stubbed out) url to be valid" do
    Upload.any_instance.expects(:do_download_remote_file).returns(nil)
    assert_no_difference 'Upload.count' do
      r = Upload.create(:attachment => nil, :attachment_url => 'invalid')
      assert r.errors.on(:attachment_file_name)
    end
  end
    
end
