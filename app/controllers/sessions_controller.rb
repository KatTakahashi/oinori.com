class SessionsController < ApplicationController

  before_action :require_login, only: [:destroy]

  def new
    @visiters = Visiter.all
  end

  def create
    admin = Admin.find_by(name: params[:name].downcase)
    if admin && admin.authenticate(params[:password])
      log_in(admin)
      redirect_to root_path
    else
      flash.now[:danger] = '名前かパスワードが間違っています。'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
