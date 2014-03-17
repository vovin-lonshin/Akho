module SessionsHelper

  def sign_in(designer)
    remember_token = Designer.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    designer.update_attribute(:remember_token, Designer.hash(remember_token))
    self.current_designer = designer
  end
  
  def current_designer=(designer)
     @current_designer = designer
   end
   
  def current_designer
    remember_token = Designer.hash(cookies[:remember_token])
    @current_designer ||= Designer.find_by(remember_token: remember_token)
  end
  
  def signed_in?
     !current_designer.nil?
   end
   
  def sign_out
    current_designer.update_attribute(:remember_token,
                                  Designer.hash(Designer.new_remember_token))
    cookies.delete(:remember_token)
    self.current_designer = nil
  end
  
  def current_designer?(designer)
      designer == current_designer
    end
   
  def redirect_back_or(default)
      redirect_to(session[:return_to] || default)
      session.delete(:return_to)
    end
  
    def store_location
      session[:return_to] = request.url if request.get?
    end
    
end