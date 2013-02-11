class Exam < ActiveRecord::Base
  attr_accessible :attempts_allowed, :name
  attr_protected :user_id, :activated
  
  has_many :question_on_exams
  has_many :questions, :through => :question_on_exams
  
  belongs_to :user
end
