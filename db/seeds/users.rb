return unless Rails.env.development?

admin_role = Spree::Role.find_or_create_by!(name: "admin")

super_admin_email = ENV.fetch("DEV_SUPERADMIN_EMAIL", "admin@example.com")
super_admin_password = ENV.fetch("DEV_SUPERADMIN_PASSWORD", "test123")

super_admin = Spree::User.find_or_initialize_by(email: super_admin_email)
super_admin.password = super_admin_password
super_admin.password_confirmation = super_admin_password
super_admin.is_super_admin = true if super_admin.respond_to?(:is_super_admin=)
super_admin.confirmed_at ||= Time.current if super_admin.respond_to?(:confirmed_at)
super_admin.spree_roles = [admin_role]
super_admin.save!

shops = [
  { name: "Shop One", subdomain: "shop-one" },
  { name: "Shop Two", subdomain: "shop-two" }
]

shops.each do |attrs|
  Shop.find_or_create_by!(subdomain: attrs[:subdomain]) do |shop|
    shop.name = attrs[:name]
  end
end

tenant_users = [
  {
    email: ENV.fetch("DEV_TENANT_ONE_EMAIL", "shop_one@example.com"),
    password: ENV.fetch("DEV_TENANT_ONE_PASSWORD", "password")
  },
  {
    email: ENV.fetch("DEV_TENANT_TWO_EMAIL", "shop_two@example.com"),
    password: ENV.fetch("DEV_TENANT_TWO_PASSWORD", "password")
  }
]

tenant_users.each do |creds|
  user = Spree::User.find_or_initialize_by(email: creds[:email])
  user.password = creds[:password]
  user.password_confirmation = creds[:password]
  user.confirmed_at ||= Time.current if user.respond_to?(:confirmed_at)
  user.spree_roles = [admin_role]
  user.save!
end
