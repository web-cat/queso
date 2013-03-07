class QuestionResponse < ActiveRecord::Base
  attr_protected :response
  
  belongs_to :exam_attempt
  belongs_to :question
end
