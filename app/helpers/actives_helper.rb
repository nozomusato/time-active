module ActivesHelper

  def active_state(active)
    # 受け取ったactiveオブジェクトが当日と一致するか評価します。
    if Date.current == active.worked_on
      return '開始️' if active.started_at.nil?
      return '終了' if active.started_at.present? && active.finished_at.nil?
    end
    # どれにも当てはまらなかった場合はfalseを返します。
    return false
  end

  # 出勤時間と退勤時間を受け取り、在社時間を計算して返します。
  def working_times(start, finish)
    format("%.2f", (((finish - start) / 60) / 60.0))
  end
end