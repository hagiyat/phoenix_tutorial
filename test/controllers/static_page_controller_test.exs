defmodule RailsTutorial.StaticPageControllerTest do
  use RailsTutorial.ConnCase

  test "GET /static_page/home" do
    conn = get conn(), "/static_page/home"
    assert html_response(conn, 200) =~ "StaticPage#home"
    assert html_response(conn, 200) =~ "<title>Ruby on Rails Tutorial Sample App | Home</title>"
  end

  test "GET /static_page/help" do
    conn = get conn(), "/static_page/help"
    assert html_response(conn, 200) =~ "StaticPage#help"
    assert html_response(conn, 200) =~ "<title>Ruby on Rails Tutorial Sample App | Help</title>"
  end

  test "GET /static_page/about" do
    conn = get conn(), "/static_page/about"
    assert html_response(conn, 200) =~ "<h1>About Us</h1>"
    assert html_response(conn, 200) =~ "<title>Ruby on Rails Tutorial Sample App | About</title>"
  end
end
