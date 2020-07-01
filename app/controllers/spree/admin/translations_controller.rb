module Spree
  class Admin::TranslationsController < Admin::BaseController
    before_action :load_parent

    helper 'spree_i18n/locale'
    helper 'spree_globalize/locale'

    helper_method :collection_url

    def index
      render resource_name
    end

    private

    def load_parent
      set_resource_ivar(resource)
    end

    def resource_name
      params[:resource].singularize
    end

    def set_resource_ivar(resource)
      instance_variable_set("@#{resource_name}", resource)
    end

    def klass
      @klass ||= "Spree::#{params[:resource].classify}".constantize
    end

    def resource
      @resource ||= klass.find(params[:resource_id])
    end

    def collection_url
      ActionController::Routing::Routes.recognize_path("admin_#{resource_name}_url", @resource)
      send "admin_#{resource_name}_url", @resource
    rescue
      send "edit_admin_#{resource_name}_url", @resource
    end
  end
end
