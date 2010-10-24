class AdminController < ApplicationController
  def select_user
    authorize! :manage, :users
    @users = User.all
  end
  def edit_user_permissions
    authorize! :manage, :users
    @user = User.find(params[:user_id])
  end
  def change_user_permissions
    authorize! :manage, :users
    @user = User.find(params[:user_id])
    @user.update_roles(params[:roles])    
    redirect_to root_url
  end
  def mail
    authenticate_user!
  end
  def send_mail
    authenticate_user!
    Resque.enqueue(MailAdmin, current_user.id, params[:message])
    redirect_to(root_url, :notice => "Your support ticket has been created. Thank you.")
  end
end
