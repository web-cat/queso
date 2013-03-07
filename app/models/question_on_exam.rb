class QuestionOnExam < ActiveRecord::Base
  attr_accessible :question_id, :exam_id, :position, :points
  
  belongs_to :exam
  belongs_to :question
  
end
