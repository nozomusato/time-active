class PlansController < ApplicationController
    
    def new
      @plan = Plan.new
    end
    
    def create
      @plan = Plan.new(plans_params)
      @plan.user_id = current_user.id #user_idの情報はフォームからはきていないので、「ログインしている自分のid」を代入
      if @plan.save
        flash[:success] = '開始しました。'
        redirect_to show_test_user_path(current_user)
      else
        render :new
      end
    end
    
    def show
      @plan = Plan.find(params[:id])
      @user = @plan.user #ユーザーレコードからplanのidを取得、代入
    end
    
    def update
      @plan = Plan.find(params[:id])
      if @plan.created_at.present?
        @plan.update_attributes(finished_at: Time.current)
        flash[:info] = "終了しました。"
      else
        flash[:danger] = '不正な入力がありました、再入力して下さい。'
      end
      redirect_to show_test_user_path(current_user)
    end
    
    private

    def plans_params
      params.require(:plan).permit(:menu,:note)
    end
end
