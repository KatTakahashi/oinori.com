class SessionsController < ApplicationController

  before_action :require_login, only: [:destroy]

  def new
    visiters
    latest_post
  end

  def create
    admin = Admin.find_by(name: params[:name].downcase)
    if admin && admin.authenticate(params[:password])
      log_in(admin)
      redirect_to login_path
    else
      flash.now[:danger] = '名前かパスワードが間違っています。'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  def visiters
    # トータルのアクセス数
    @visiters = Visiter.all
    # トータルの利用人数
    @visiters_ip = Visiter.distinct.pluck(:ip)
    # 本日のアクセス数
    @visiters_today =@visiters.where(created_at: Time.zone.now.all_day)
    # 本日の利用人数
    @visiters_today_ip = Visiter.where(created_at: Time.zone.now.all_day).distinct.pluck(:ip)
  end
end
