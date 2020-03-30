class PlansController < ApplicationController
    
    def create
      @plan = Plan.new(plan_params)
      @plan.created_at = Time.current.change(sec: 0)
      @plan.user_id = current_user.id #user_idの情報はフォームからはきていないので、「ログインしている自分のid」を代入
      if @plan.save
        flash[:success] = '開始しました。'
        redirect_to logs_user_path(current_user)
      else
        render :new
      end
    end
    
    def edit
      @plan = Plan.find(params[:id])
      @user = @plan.user
    end
    
    def update_modal
      @plan = Plan.find(params[:id])
      if  @plan.update_attributes(time_plan_params)
        flash[:info] = "更新しました。"
      else
        flash[:danger] = @plan.errors.full_messages.join("<br>")
      end
      redirect_to logs_user_path(current_user)
    end
    
    def update
      @plan = Plan.find(params[:id])
      if @plan.created_at.present?
        @plan.update_attributes(finished_at: Time.current.change(sec: 0))
        flash[:success] = "終了しました。"
      else
        flash[:danger] = '不正な入力がありました、再入力して下さい。'
      end
      redirect_to start_user_path(current_user)
    end
    
    
    def destroy
      @plan = Plan.find(params[:id])
      @plan.destroy
      flash[:success] = "データを削除しました。"
      redirect_to logs_user_path(current_user)
    end
    
    private

    def plan_params
      params.require(:plan).permit(:menu,:note,:latitude,:longitude)
    end
    
    def time_plan_params
      params.require(:plan).permit(:menu,:created_at,:finished_at,:note)
    end
end
