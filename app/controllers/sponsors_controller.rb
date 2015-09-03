class Sponsors::SessionsController < Devise::SessionsController
  def create
    # Find the sponsor type
    sponsor_class = nil
    is_sponsor?(params[:sponsor])
    sponsor_class = :sponsor

    # Attempt authentication with Warden
    self.resource = warden.authenticate(scope: sponsor_class)
    if self.resource.nil?
      # Authentication failed
      flash[:error] = "Invalid username or password."
      return redirect_to new_session_path
    end

    # Successful authentication
    sign_in(sponsor_class, self.resource)
    respond_with self.resource, :location => after_sign_in_path_for(self.resource)
  end

  def destroy
    sign_out(self.resource)
    redirect_to "/"
  end

  def new
    self.resource = Sponsor.new
  end

  private

  def is_sponsor?(username)
    a = Sponsor.find_by_username(username)
    !a.nil?
  end

  def is_user?(username)
    u = User.find_by_username(username)
    !u.nil?
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      super
    elsif resource.is_a?(Sponsor)
      return '/sponsor'
    end
  end
end
