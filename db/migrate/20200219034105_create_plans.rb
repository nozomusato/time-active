class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :menu
      t.datetime :finished_at
      t.string :note
      t.string :prefectures
      t.string :city
      t.string :town
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
