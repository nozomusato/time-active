class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info,:logs,:totalization]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy, :edit_basic_info, :update_basic_info]
  before_action :set_one_month, only: [:show,:logs,:totalization]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  end
  
  def show_test
    @user = User.find(params[:id])
    @plan = Plan.find(params[:id])
    @plans = @user.plans.where(finished_at: nil)
    
    @chart = [
      ['created_at', "#{@user.plans.where.not(created_at: nil).count}"],
      ['finished_at', "#{@user.plans.where.not(finished_at: nil).count}"]
      ]
    
    @chart_2 = [
      ['フリー', "#{@user.plans.where(menu: ['フリー']).count}"],
      ['運動', "#{@user.plans.where(menu: ['運動']).count}"],
      ['仕事', "#{@user.plans.where(menu: ['仕事']).count}"],
      ['食事', "#{@user.plans.where(menu: ['食事']).count}"],
      ['睡眠', "#{@user.plans.where(menu: ['睡眠']).count}"]
      ]
  end
  
  def logs
    @plans = @user.plans.order(id: "DESC")
    @sales = Plan.where(created_at: Date.current.beginning_of_month..Date.current.end_of_month)
  .group("YEAR(created_at)")
  .group("MONTH(created_at)")
  .group("DAY(created_at)")
  .count()
  end
  
  def totalization
    @plans = @user.plans.order(id: "DESC")
    @first = Date.current.beginning_of_month
    @last = @first.end_of_month
    @days = (@first..@last)
  end
  
  def csv_dl
    @user = User.find(params[:id])
    @plan = Plan.find(params[:id])
    @lists = @user.plans
    
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
      redirect_to @user
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