module RailsDomIdHelper
	def dom_id_for(model)
		# Whatever model we send in, we need to know the appropriate action, so we use
		["#", ActionView::RecordIdentifier.dom_id(model)].join
	end
end