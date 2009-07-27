require 'test_helper'

class UploadsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create upload" do
    assert_difference('Upload.count') do
      post :create, :upload => { :attachment => fixture_file_upload('files/rails.png', 'image/png') }
    end
    assert_redirected_to admin_path
  end

  test "should create upload via (stubbed out) url" do
    Upload.any_instance.expects(:do_download_remote_file).returns(File.open("#{Rails.root}/test/fixtures/files/rails.png"))
    assert_difference 'Upload.count' do
      post :create, :upload => { :attachment_url => 'rails.png' }
    end
    assert_redirected_to admin_path
  end
  
  test "should not bomb on upload via bogus (stubbed out) url" do
    Upload.any_instance.expects(:do_download_remote_file).returns(nil)
    assert_no_difference 'Upload.count' do
      post :create, :upload => { :attachment_url => 'invalid' }
    end
    assert_response :success
  end
  
  test "should destroy upload" do
    u = Upload.make
    assert_difference('Upload.count', -1) do
      delete :destroy, :id => u.to_param
    end
    assert_redirected_to admin_path
  end
    
end
