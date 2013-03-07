class Exam < ActiveRecord::Base
  attr_accessible :attempts_allowed, :name
  attr_protected :user_id, :activated
  
  has_many :question_on_exams, :dependent => :destroy
  has_many :questions, :through => :question_on_exams
  
  accepts_nested_attributes_for :question_on_exams # TODO: rejects if...?
  
  belongs_to :user # This is just to track who CREATED this exam.
  
  validates_presence_of :available_at, :closes_at
end
