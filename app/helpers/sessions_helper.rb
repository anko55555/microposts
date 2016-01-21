module SessionsHelper
    
  # ||=は左の値がfalseかnilの場合に右の値の代入を行います。変数を初期化する際によく用いられます。
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # !!は、右側に続く値が存在する場合はtrueを、nilの場合はfalseを返します
  def logged_in?
    !!current_user
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end