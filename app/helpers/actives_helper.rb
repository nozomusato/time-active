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
end