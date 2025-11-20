class ApplicationController < ActionController::Base
	before_action :set_current_shop

	private

	def set_current_shop
		shop = nil

		if request.respond_to?(:subdomain) && request.subdomain.present? && request.subdomain != 'www'
			shop = Shop.find_by(subdomain: request.subdomain)
		end

		shop ||= Shop.find_by(id: params[:shop_id]) if params[:shop_id].present?
		shop ||= Shop.first

		ActsAsTenant.current_tenant = shop
		@current_shop = shop
	end
end

