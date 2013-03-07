class Ability
  include CanCan::Ability

  def initialize(user)
    
    if !user
      can :create, User
      
    elsif user.role == "admin"
      can :manage, :all
      
    elsif user.role == "instructor"
      # TODO: Instructors should only be able to see their own students. Or something like that...
      can :read, User, :role => "student"
      can :read, User, :id => user.id
      can :update, User, :id => user.id
      
      can :read, Exam, :user_id => user.id
      can :create, Exam
      can :manage, Exam do |exam|
        exam.try(:user) == user && exam.try(:activated) == false
      end
      
      can :read, ExamAttempt # TODO: Should instructors be able to see all students' attempts? (not only their students?)
      can :create, ExamAttempt
      can :update, ExamAttempt do |attempt|
        attempt.try(:exam).available_at < Time.now && attempt.try(:exam).closes_at >= Time.now
      end
      
      can :read, Question
      can :create, Question
      can :update, Question do |question|
        question.try(:user) == user && question.try(:used) == false
      end
      can :destroy, Question do |question|
        question.try(:user) == user && question.try(:used) == false
      end
            
    elsif user.role == "student"
      can :read, User, :id => user.id
      can :update, User, :id => user.id
      
      # TODO: Students need to be able to see past and pending exam attempts.
      can :read, ExamAttempt, :user_id => user.id
      can :create, ExamAttempt
      can :update, ExamAttempt do |attempt|
        attempt.try(:available_at) < Time.now && attempt.try(:closes_at) + 1.minute >= Time.now # TODO: The extra minute is just to be safe. Is this ok?
      end
    end
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
