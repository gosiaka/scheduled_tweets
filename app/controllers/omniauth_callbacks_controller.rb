class OmniauthCallbacksController < ApplicationController
  def twitter
    Rails.logger.info auth   # print out info in Rails logs

    twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
    twitter_account.update(
      name: auth.info.name,
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret,
    )

    redirect_to root_path, notice: "Successfully connected your account"
  end

  def auth
    # give us a hash of credentials from twitter
    request.env['omniauth.auth']
  end
end
