class SessionsController < ApplicationController
  def new
  end


  #　ログイン処理
  def create
    # ユーザーをメールアドレスから検索します。
    @user = User.find_by(email: params[:session][:email].downcase)
    
    # もしユーザーが見つかった場合は、authenticateメソッドでパスワードが正しいか調べます。
    # パスワードが正しい場合は、session[:user_id]にユーザーIDを入れ、ユーザーの詳細ページにリダイレクトします。
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:info] = "logged in as #{@user.name}"
      redirect_to @user
      
      # パスワードが間違っている場合は’new’テンプレートを表示します。
      else
      flash[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  
  
  
  #　ログアウト処理
  #　session[:user_id]をnilにしています。これでサーバーとブラウザの両方でセッションの情報が破棄されます。
  #  アプリケーションのルート/にリダイレクトします。
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end