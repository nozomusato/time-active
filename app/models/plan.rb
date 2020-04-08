class Plan < ApplicationRecord
    belongs_to :user
    
    validates :menu, presence: true
    validates :created_at, presence: true
    
    # 出勤時間が存在しない場合、退勤時間は無効
  validate :finished_at_is_invalid_without_a_created_at
  # 出勤・退勤時間どちらも存在する時、出勤時間より早い退勤時間は無効
  validate :created_at_than_finished_at_fast_if_invalid
  

  def finished_at_is_invalid_without_a_created_at
    errors.add(:created_at, "が必要です") if created_at.blank? && finished_at.present?
  end

  def created_at_than_finished_at_fast_if_invalid
    if created_at.present? && finished_at.present?
      errors.add(:created_at, "より早い終了時間は無効です") if created_at > finished_at
    end
  end
  
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Plan.where(['menu LIKE ?', "%#{search}%"])
    else
      Plan.all #全て表示。
    end
  end
end
