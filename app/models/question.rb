class Question < ActiveRecord::Base
  TYPES = %w[true_or_false_question multiple_choice_question]
  
  attr_accessible :points, :statement, :user_id, :options, :answer
  
  serialize :options
  
  has_many :question_on_exams, :dependent => :destroy
  has_many :exams, :through => :question_on_exams
  
  has_many :taggings
  has_many :tags, :through => :taggings
  
  has_many :question_responses
  
  belongs_to :user
  
  def self.to_csv
    require 'csv'
    
    CSV.generate do |csv|
      csv << ["#", "Statement", "Default Points", "Made By"]
      all.each do |question|
        csv << [question.id, question.statement, question.points, question.user.lastname || "Not Found"]
      end
    end    
  end
  
end
