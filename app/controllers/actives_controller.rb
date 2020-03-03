class ActivesController < ApplicationController
  before_action :set_user, only: [:edit_one_month, :update_one_month]
  before_action :logged_in_user, only: [:update, :edit_one_month]
  before_action :admin_or_correct_user, only: [:update, :edit_one_month, :update_one_month]
  before_action :set_one_month, only: :edit_one_month

  UPDATE_ERROR_MSG = "勤怠登録に失敗しました。やり直してください。"

  def update
    @user = User.find(params[:user_id])
    @active = Active.find(params[:id])
    # 出勤時間が未登録であることを判定します。
    if @active.started_at.nil?
      if @active.update_attributes(started_at: Time.current.change(sec: 0))
        flash[:info] = "おはようございます！"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    elsif @active.finished_at.nil?
      if @active.update_attributes(finished_at: Time.current.change(sec: 0))
        flash[:info] = "お疲れ様でした。"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    end
    redirect_to @user
  end
  
  def update_edit_action
    # 該当の日付の情報を更新
    active = Active.find(params[:active_id])
    permit_status = edit_action_params
    if
      active.update_attributes(permit_status)
      flash[:success] = '情報を更新しました。'
      redirect_to logs_user_path(current_user)
    else
      flash[:danger] = '不正な入力がありました、再入力して下さい。'
      redirect_to logs_user_path(current_user)
    end
  end
  
  def edit_one_month
  end
  
  def update_one_month
  ActiveRecord::Base.transaction do # トランザクションを開始します。
    actives_params.each do |id, item|
      active = Active.find(id)
      active.update_attributes!(item)
    end
  end
  flash[:success] = "1ヶ月分の勤怠情報を更新しました。"
  redirect_to user_url(date: params[:date])
  rescue ActiveRecord::RecordInvalid # トランザクションによるエラーの分岐です。
  flash[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
  redirect_to actives_edit_one_month_user_url(date: params[:date])
  end
  
  private
    # 1ヶ月分の勤怠情報を扱います。
    def actives_params
      params.require(:user).permit(actives: [:started_at, :finished_at, :note])[:actives]
    end
    
    def edit_action_params
      params.permit(actives: [:menu,:started_at, :finished_at, :note])[:actives]
    end
    
        # beforeフィルター

    # 管理権限者、または現在ログインしているユーザーを許可します。
    def admin_or_correct_user
      @user = User.find(params[:user_id]) if @user.blank?
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "編集権限がありません。"
        redirect_to(root_url)
      end  
    end
  
end