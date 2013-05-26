class ExamAttempt < ActiveRecord::Base
  attr_protected :available_at, :closes_at, :exam_id, :user_id
  
  belongs_to :user
  belongs_to :exam
  
  has_many :question_responses
end
