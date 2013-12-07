module ApiHelper

  def company
    @company ||= Company[params[:company_id].to_i] || not_found
  end

end