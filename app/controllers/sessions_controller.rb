class SessionsController < ApplicationController

  def new
    end
  
    def create
      designer = Designer.find_by(email: params[:session][:email].downcase)
      if designer && designer.authenticate(params[:session][:password])
        sign_in designer
        redirect_to designer
      else
        flash.now[:error] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end
    end
  
   def destroy
      sign_out
      redirect_to root_url
    end
end
