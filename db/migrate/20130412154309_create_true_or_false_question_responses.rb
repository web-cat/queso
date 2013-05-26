class CreateTrueOrFalseQuestionResponses < ActiveRecord::Migration
  def change
    create_table :true_or_false_question_responses do |t|

      t.timestamps
    end
  end
end
