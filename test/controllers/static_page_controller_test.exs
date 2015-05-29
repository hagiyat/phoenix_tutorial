defmodule RailsTutorial.StaticPageControllerTest do
  use RailsTutorial.ConnCase

  test "GET /static_page/home" do
    conn = get conn(), "/static_page/home"
    assert find_contents(conn, "title") == {["Hello Phoenix!"]}
    assert find_contents(conn, "h1") == {["StaticPage#home"]}
  end

  test "GET /static_page/help" do
    conn = get conn(), "/static_page/help"
    assert conn.status == 200
    assert find_contents(conn, "title") == {["Hello Phoenix!"]}
    assert find_contents(conn, "h1") ==  {["StaticPage#help"]}
  end

  test "GET /static_page/about" do
    conn = get conn(), "/static_page/about"
    assert conn.status == 200
    assert find_contents(conn, "title") == {["Hello Phoenix!"]}
    assert find_contents(conn, "h1") ==  {["About Us"]}
  end
end
