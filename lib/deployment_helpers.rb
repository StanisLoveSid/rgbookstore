module DeploymentHelpers
  module_function

  def development_create_order
    delivery = Delivery.first
    country = Country.first

    order = FactoryGirl.create :order,
                               :with_credit_card,
                               delivery: delivery

  end
end
