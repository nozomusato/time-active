class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :menu
      t.datetime :finished_at
      t.string :note
      t.string :address #住所
      t.float :latitude #緯度
      t.float :longitude #緯度
      
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
