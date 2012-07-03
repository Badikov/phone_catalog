module PhonesHelper

  def phone_search_params
    search_params = {}
    Phone.attribute_names.find_all{ |a| !params[a].blank? }.each{ |a| search_params[a] = params[a] }
    search_params
  end
end
