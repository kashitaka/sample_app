require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "login with invalid information" do
    # パスの確認
    get login_path
    assert_template 'sessions/new'
    # 不正なログイン情報を送信
    post login_path, session: {email: "", password: ""}
    assert_template 'sessions/new'
    assert_not flash.empty?
    # エラーが他の画面でも出てしまうバグが出ないこと
    get root_path
    assert flash.empty?
  end
end
