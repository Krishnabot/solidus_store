Spree::Product.class_eval do
  acts_as_tenant :shop

  belongs_to :shop, class_name: '::Shop', optional: true
end
