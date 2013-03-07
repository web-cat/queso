class CreateExamAttempts < ActiveRecord::Migration
  def change
    create_table :exam_attempts do |t|
      t.integer :user_id
      t.integer :exam_id      

      t.timestamps
    end
  end
end
