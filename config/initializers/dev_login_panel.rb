if Rails.env.development?
  Rails.application.config.x.dev_login_panel = {
    super_admin: {
      email: ENV.fetch('DEV_SUPERADMIN_EMAIL', 'admin@example.com'),
      password: ENV.fetch('DEV_SUPERADMIN_PASSWORD', 'test123')
    },
    tenant_shops: [
      {
        label: 'Tenant shop #1',
        email: ENV.fetch('DEV_TENANT_ONE_EMAIL', 'shop_one@example.com'),
        password: ENV.fetch('DEV_TENANT_ONE_PASSWORD', 'password')
      },
      {
        label: 'Tenant shop #2',
        email: ENV.fetch('DEV_TENANT_TWO_EMAIL', 'shop_two@example.com'),
        password: ENV.fetch('DEV_TENANT_TWO_PASSWORD', 'password')
      }
    ]
  }
end
