class CreateQuestionResponses < ActiveRecord::Migration
  def change
    create_table :question_responses do |t|
      t.string :response
      t.integer :exam_attempt_id
      t.integer :question_id

      t.timestamps
    end
  end
end
