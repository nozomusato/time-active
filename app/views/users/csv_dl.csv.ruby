CSV.generate do |csv|
  csv_column_names = %w(メニュー 開始時間 終了時間 合計時間 メモ)
  csv << csv_column_names
  @lists.each do |list|
    menu = list.menu
    creat = list.created_at.nil? ?    "" : "#{list.created_at.strftime("%Y年%m月%d日 %H:%M")}"
    finish = list.finished_at.nil? ?    "" : "#{list.finished_at.strftime("%Y年%m月%d日 %H:%M")}"
    sum = working_times(list.created_at, list.finished_at)
    note = list.note
    
    csv_column_values = [
      menu,
      creat,
      finish,
      sum,
      note
    ]
    csv << csv_column_values
  end
end


