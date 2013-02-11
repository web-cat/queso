class User < ActiveRecord::Base
  ROLES = %w[admin instructor student]
  
  acts_as_authentic do |c|
    c.login_field = :email
    c.merge_validates_length_of_password_field_options({:minimum => 6, :message => " must have at least 6 characters."})
  end
  
  attr_accessible :firstname, :lastname, :username
  attr_protected :crypted_password, :email, :password_salt, :persistence_token
  
  has_many :exams
  has_many :questions
  
  def make_admin_if_first
    self.role = "admin" if !User.any?
  end
  
  def self.to_csv
    require 'csv'
    
    CSV.generate do |csv|
      csv << ["#", "Full Name", "Username", "Email", "Role"]
      # csv << fields.collect(&:humanize)
      all.each do |user|
        csv << [user.id, user.firstname + " " + user.lastname, user.username, user.email, user.role.humanize]
        # csv << user.attributes.values_at(*fields)
      end
    end    
  end
  
end
