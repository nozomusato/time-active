class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info,:logs,:logs_month,:logs_day,:start,:csv_dl]
  before_action :logged_in_user, only: [:index, :show,:start,:places, :logs, :logs_month, :logs_day,:csv_dl,:edit_action,:edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :correct_user, only: [:show,:start,:logs_month,:logs_day,:edit_action,:destroy,:edit, :update]
  before_action :admin_user, only: [:destroy, :edit_basic_info, :update_basic_info]

  def index
    @users = User.all.page(params[:page])
  end

  def show
  end
  
  def start
    @plan = @user.plans
    @plans = @user.plans.where(finished_at: nil).order(id: "DESC")
  end
  
  def places
    @plan = Plan.find(params[:id])
  end
  
  def logs
    @menu_sum = @user.plans.where.not(created_at: nil).count #存在しているplanの数
    @plans = @user.plans.order(created_at: "DESC")
    @frees = @user.plans.where(menu: ['フリー'])
    @frees_sum = 0
    @studys = @user.plans.where(menu: ['勉強'])
    @studys_sum =0
    @sports = @user.plans.where(menu: ['運動'])
    @sports_sum =0
    @jobs = @user.plans.where(menu: ['仕事'])
    @jobs_sum =0
    @meals = @user.plans.where(menu: ['食事'])
    @meals_sum =0
    @sleeps = @user.plans.where(menu: ['睡眠'])
    @sleeps_sum =0
  end
  
  def logs_month
    @month_first = params[:date].nil? ?
    Time.current.beginning_of_month : params[:date].to_time #○/1だけ非表示になるためTimeクラス
    @month_last = @month_first.end_of_month.to_time
    @plans = @user.plans.where(created_at: @month_first..@month_last).order(id: "DESC")
    @frees = @user.plans.where(created_at: @month_first..@month_last,menu: ['フリー'])
    @frees_sum = 0
    @studys = @user.plans.where(created_at: @month_first..@month_last,menu: ['勉強'])
    @studys_sum =0
    @sports = @user.plans.where(created_at: @month_first..@month_last,menu: ['運動'])
    @sports_sum =0
    @jobs = @user.plans.where(created_at: @month_first..@month_last,menu: ['仕事'])
    @jobs_sum =0
    @meals = @user.plans.where(created_at: @month_first..@month_last,menu: ['食事'])
    @meals_sum =0
    @sleeps = @user.plans.where(created_at: @month_first..@month_last,menu: ['睡眠'])
    @sleeps_sum =0
  end
  
  def logs_day
    @today_first = params[:date].nil? ?
    Time.current.beginning_of_day : params[:date].to_time
    @today_last = @today_first.end_of_day.to_time
    @plans = @user.plans.where(created_at: @today_first..@today_last).order(id: "DESC")
    @frees = @user.plans.where(created_at: @today_first..@today_last,menu: ['フリー'])
    @frees_sum = 0
    @studys = @user.plans.where(created_at: @today_first..@today_last,menu: ['勉強'])
    @studys_sum =0
    @sports = @user.plans.where(created_at: @today_first..@today_last,menu: ['運動'])
    @sports_sum =0
    @jobs = @user.plans.where(created_at: @today_first..@today_last,menu: ['仕事'])
    @jobs_sum =0
    @meals = @user.plans.where(created_at: @today_first..@today_last,menu: ['食事'])
    @meals_sum =0
    @sleeps = @user.plans.where(created_at: @today_first..@today_last,menu: ['睡眠'])
    @sleeps_sum =0
  end
  
  def csv_dl
    @lists = @user.plans.order(created_at: "DESC")
    
    respond_to do |format|
      # format.html do
      #     #html用の処理を書く
      # end 
      format.csv do
          send_data render_to_string, filename: "#{@user.name}logs.csv", type: :csv
      end
    end
  end
  
  def edit_action
    @active_id = params[:id] #idを取得し@active_idに代入
    @user = Active.find(params[:id]).user #userレコードからactiveモデルのidを取得し、@userに代入
    @dates = @user.actives.find(@active_id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to start_user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit      
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  def edit_basic_info
  end

  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
    end
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :department, :password, :password_confirmation)
    end

    def basic_info_params
      params.require(:user).permit(:department, :basic_time, :work_time)
    end

    
end