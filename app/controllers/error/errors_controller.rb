class Error::ErrorsController < ApplicationController
  layout false

  def not_found
    return render_error_not_found
  end

  def internal_server_error
    return render_error_internal_server_error
  end

  protected
  def render_error_not_found
    respond_to do |format|
      format.html {render file: "#{Rails.root}/public/404.html"}
      format.json {render status: :not_found, json: {errors: [I18n.t('render.error.not_found')]}}
    end
  end

  def render_error_internal_server_error
    respond_to do |format|
      format.html {render file: "#{Rails.root}/public/500.html"}
      format.json {render status: :internal_server_error, json: {errors: [I18n.t('render.error.internal_server_error')]}}
    end
  end
end
