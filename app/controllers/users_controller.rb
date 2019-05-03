# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
    query = params[:user_search]
    @search_results = User.search_emails_and_usernames(query)
  end
  
  def new
  end

  def create
    username = params[:user][:username]
    email = params[:user][:email_address].downcase
    password = params[:user][:password]

    user = User.new(username: username, email: email, password: password)

    if user.valid?
      user.save
      log_in(user)
      flash[:success] = "New account created"
      redirect_to "/#{current_user.username}" and return
    else
      flash[:danger] = user.errors.full_messages.join("<br>")
    end

    redirect_to root_path
  end


end
