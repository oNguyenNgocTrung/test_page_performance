class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :detect_browser

  private
  def mobile?
    iphone = request.user_agent =~ /iPhone/
    ipod_touch = request.user_agent =~ /iPod touch/
    ipad = request.user_agent =~ /iPad/
    android = request.user_agent =~ /Android/
    android_tablet = request.user_agent =~ Regexp.union(/(?!Android.+Mobile)Android/, /Android.+SC-01C/)
    (iphone || ipod_touch || android) && !ipad && !android_tablet
  end

  def tablet?
    ipad = request.user_agent =~ /iPad/
    android_tablet = request.user_agent =~ Regexp.union(/(?!Android.+Mobile)Android/, /Android.+SC-01C/)
    ipad || android_tablet
  end

  def detect_browser
    request.variant = case true
                      when mobile?
                        :mobile
                      when tablet?
                        :tablet
                      else
                        :desktop
                      end
  end
end
