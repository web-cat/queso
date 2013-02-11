class Question < ActiveRecord::Base
  attr_accessible :points, :statement
  attr_protected :user_id
  
  has_many :question_on_exams
  has_many :exams, :through => :question_on_exams
  
  has_many :taggings
  has_many :tags, :through => :taggings
  
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
