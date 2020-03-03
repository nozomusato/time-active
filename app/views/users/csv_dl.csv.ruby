CSV.generate do |csv|
  csv_column_names = %w(メニュー 日付 開始時間 終了時間 メモ)
  csv << csv_column_names
  @lists.each do |list|
    menu = list.menu
    date = list.created_at.nil? ?    "" : "#{list.created_at.year}年#{list.created_at.month}月#{list.created_at.day}日"
    creat = list.created_at.nil? ?    "" : "#{list.created_at.hour}:#{list.created_at.min}"
    finish = list.finished_at.nil? ?    "" : "#{list.finished_at.hour}:#{list.finished_at.min}"
    note = list.note
    
    csv_column_values = [
      menu,
      date,
      creat,
      finish,
      note
    ]
    csv << csv_column_values
  end
end


