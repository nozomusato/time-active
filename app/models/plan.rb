class Plan < ApplicationRecord
    belongs_to :user
    
    validates :menu, presence: true
    validates :note, presence: true
    
    # 出勤時間が存在しない場合、退勤時間は無効
  validate :finished_at_is_invalid_without_a_created_at
  # 出勤・退勤時間どちらも存在する時、出勤時間より早い退勤時間は無効
  validate :created_at_than_finished_at_fast_if_invalid
  
  # validate :created_at_fast_if_invalid
  
  # def created_at_fast_if_invalid
  #   errors.add(:created_at, "が必要です") if created_at.present?
  # end

  def finished_at_is_invalid_without_a_created_at
    errors.add(:created_at, "が必要です") if created_at.blank? && finished_at.present?
  end

  def created_at_than_finished_at_fast_if_invalid
    if created_at.present? && finished_at.present?
      errors.add(:created_at, "より早い退勤時間は無効です") if created_at > finished_at
    end
  end
end
