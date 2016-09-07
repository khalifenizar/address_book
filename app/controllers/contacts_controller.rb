class ContactsController < ApplicationController
  def home
    render :home
  end

  def index
    @contacts_array = Contact.order(name: "asc")

    render :index
  end


  def new
    render :new
  end

  def create
    the_contact = Contact.new(
      :name => params[:contact][:name],
      :address => params[:contact][:address],
      :phone_number => params[:contact][:phone_number],
      :email_address => params[:contact][:email_address])

    email_pattern = /^\w+@\w+\.[A-Za-z]+$/
    phone_pattern = /(\+1 )?\(?[0-9]{3}\)? ?-?[0-9]{3}-?[0-9]{4}/

    if (the_contact.email_address =~ email_pattern) != nil &&
       (the_contact.phone_number =~ phone_pattern) != nil
      the_contact.save
      redirect_to("/contacts")
    else
      redirect_to("/contacts/new")
    end
  end


  def show
    @the_contact = Contact.find( params[:id] )

    render :show
  end
end
