class GroupsTest < ActionDispatch::IntegrationTest

  test "should route to group" do
    assert_routing '/groups/1', { controller: "groups",
                                  action: "show", id: "1" }
  end

  test "should route to create group" do
    assert_routing({ method: 'post', path: '/groups' },
                   { controller: "groups", action: "create" })
  end

  test "should route to group index" do
    assert_routing '/groups', { controller: "groups",
                                action: "index"}
  end


end
