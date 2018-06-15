class ContactsController < ApplicationController
  before_action :set_contact_params, only: [:confirm, :create]

  def index
    @contacts = Contact.all.reverse_order
  end

  def new
    @contact = Contact.new
  end

  def confirm
    render :new if @contact.invalid?
  end

  def create
    if @contact.save
      redirect_to contacts_path, notice: '送信しました！'
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end

  def set_contact_params
    @contact = Contact.new(contact_params)
  end
end
