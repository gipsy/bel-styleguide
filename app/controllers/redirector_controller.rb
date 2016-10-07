class RedirectorController < ActionController::Base
  include RedirectorSupport
  
  def show
    encrypted_url = params[:encrypted_url]
    url           = Bellroy::UrlEncryptor.decrypt(encrypted_url)

    increment_stats_bucket_for_redirected_url(url)
    redirect_to(url)
  rescue Bellroy::UrlEncryptor::BadUrl
    increment_stats_bucket_for_bad_redirected_url(encrypted_url)
    render :status => :bad_request, :nothing => true
  end

  def internal
    begin
      url = Bellroy::UrlValidator.validate(params[:url])
      redirect_to url
    rescue Bellroy::UrlValidator::InvalidUrl
      render text: 'Not Found', status: '404'
    end
  end
end
