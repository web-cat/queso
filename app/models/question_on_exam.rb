class QuestionOnExam < ActiveRecord::Base
  attr_accessible :question_id, :test_id
  
  belongs_to :exam
  belongs_to :question
  
end
