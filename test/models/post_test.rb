require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "testex@test.cz", 
      password: "abcd1234", 
      name: "John",
      last_name: "Donne",
      dob:"17/11/1997",
      country: "de",
     )
    @post = @user.posts.build(body: 'Body post', user_id: 3)
  end
  
  test 'post length should not exceed 760 chars' do
    @post.body = 'a'*761
    assert_not @post.valid?
  end

  test "setup post should be valid" do
    assert @post.valid?
  end
end
