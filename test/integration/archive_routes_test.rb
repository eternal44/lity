class ArchivesTest < ActionDispatch::IntegrationTest

  test "should route to archive" do
    assert_routing '/archives/1',
      { controller: "groups/archives", action: "show", id: "1" }
  end

  test "should route to create archive" do
    assert_routing({ method: 'post', path: '/groups/1/archives' },
      { controller: "groups/archives", action: "create", group_id: "1" })
  end

  test "should route to archive index" do
    assert_routing '/groups/1/archives',
      { controller: "groups/archives", action: "index", group_id: "1"}
  end
end
