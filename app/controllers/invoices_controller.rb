class InvoicesController < ApplicationController
   def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.friendly.find(params[:id])
  end
end
