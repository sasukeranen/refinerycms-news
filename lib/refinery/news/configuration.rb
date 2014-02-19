module Refinery
	module News
		include ActiveSupport::Configurable

		config_accessor :page_url

		self.page_url = "/news"
	end
end