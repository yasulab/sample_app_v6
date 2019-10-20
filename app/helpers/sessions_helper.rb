module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def current_user
    # DB への問い合わせの数を可能な限り小さくしたい
    if session[:user_id]
      #User.find_by(id: session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id])
      #@current_user = @current_user ||  User.find
      #if @current_user.nil?
      #  @current_user = User.find_by(id: session[:user_id])
      #  return @current_user
      #else
      #  return @current_user
      #end
    end
  end
  
  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
  
  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
