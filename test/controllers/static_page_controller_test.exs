defmodule RailsTutorial.StaticPageControllerTest do
  use RailsTutorial.ConnCase

  test "GET /static_page/home" do
    conn = get conn(), "/static_page/home"
    assert html_response(conn, 200) =~ "StaticPage#home"
  end

  test "GET /static_page/help" do
    conn = get conn(), "/static_page/help"
    assert html_response(conn, 200) =~ "StaticPage#help"
  end

  test "GET /static_page/about" do
    conn = get conn(), "/static_page/about"
    assert html_response(conn, 200) =~ "About Us"
  end
end
