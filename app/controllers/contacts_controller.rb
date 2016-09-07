class ContactsController < ApplicationController
  def home
    render :home
  end

  def index
    @contacts_array = Contact.all

    render :index
  end
end
