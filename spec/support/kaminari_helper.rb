module KaminariHelper

  def stub_kaminari_methods(collection)
    collection.stub(:page).and_return(collection)
    collection.stub(:per).and_return(collection)
    collection.stub(:num_pages).and_return(1)
    collection.stub(:current_page).and_return(1)
  end
end