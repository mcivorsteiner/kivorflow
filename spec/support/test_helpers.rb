module TestHelpers
  # extend self

  def log_in_user(user)
    visit root_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_button 'Login'
  end

  def stub_current_user(user)
    ApplicationController.any_instance.stub(:current_user) {user}
  end

  def build_attributes(*args)
    FactoryGirl.build(*args).attributes.delete_if do |k, v| 
      ["id", "created_at", "updated_at"].member?(k)
    end
  end

  def create_question_comment(user, question)
    question.comments.create(user_id: user.id, content: "this is a question comment")
  end

  def create_answer_comment(user, answer)
    answer.comments.create(user_id: user.id, content: "this is an answer comment")
  end

  def create_question_vote(user, question)
    question.votes.create(user_id: user.id, value: 1)
  end

  def create_answer_vote(user, answer)
    answer.votes.create(user_id: user.id, value: 1)
  end
end