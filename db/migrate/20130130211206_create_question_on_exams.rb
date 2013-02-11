class CreateQuestionOnExams < ActiveRecord::Migration
  def change
    create_table :question_on_exams do |t|
      t.integer :exam_id
      t.integer :question_id
      t.integer :position
      t.integer :points

      t.timestamps
    end
  end
end
