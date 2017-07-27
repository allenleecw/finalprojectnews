class SessionsController < Clearance::SessionsController

  def destroy
    sign_out
    redirect_to sign_up_path
  end
end 