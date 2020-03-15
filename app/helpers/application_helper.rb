module ApplicationHelper

  def full_title(page_name = "")
    base_title = "TimeActive"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end
  
  # 出勤時間と退勤時間を受け取り、在社時間を計算して返します。
  def working_times(created_at, finished_at)
    format("%.2f", (((finished_at - created_at) / 60) / 60.0))
  end
  
  def working_times_sum(seconds) #seconds=(plan.finished_at - plan.created_at).to_i
    format("%.2f", seconds / 60 / 60.0)
  end
end