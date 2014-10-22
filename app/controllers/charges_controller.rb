class ChargesController < ApplicationController

  before_filter :authenticate_user!

 
  def new
    @amount = 999
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.name}",
      amount: @amount
    }
  end

  def create
    @amount = 9_99
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

    current_user.invoices.create(amount: @amount, description: "Premium Membership - #{current_user.email}")
    current_user.update_attribute(:premium, true)
    
    flash[:success] = "Thanks for signing up for a Premium Membership!  You can now create private wikis and add collaborators."
    redirect_to wikis_path
  rescue Stripe:: CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path   
  end
end