class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  # Value is used in view_variable.view_human string
  def calculateViewHuman(value)
    if !@view_variable.view_human.nil?
      begin
        eval(@view_variable.view_human)
      rescue SyntaxError => e # If eval generate SyntaxError, we control error
        return
      end
    end
  end

end
