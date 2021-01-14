# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshots

!["Admin all products](https://github.com/Kevinli296/jungle-rails/blob/master/docs/admin_all_products.png?raw=true)

!["Admin all categories"](https://github.com/Kevinli296/jungle-rails/blob/master/docs/admin_categories.png?raw=true)

!["Admin dashboard"](https://github.com/Kevinli296/jungle-rails/blob/master/docs/admin_dashboard.png?raw=true)

!["All products"](https://github.com/Kevinli296/jungle-rails/blob/master/docs/all_products.png?raw=true)

!["Login"](https://github.com/Kevinli296/jungle-rails/blob/master/docs/login.png?raw=true)

!["Signup"](https://github.com/Kevinli296/jungle-rails/blob/master/docs/signup.png?raw=true)

!["My cart"](https://github.com/Kevinli296/jungle-rails/blob/master/docs/my_cart.png?raw=true)

!["Swipe"](https://github.com/Kevinli296/jungle-rails/blob/master/docs/swipe.png?raw=true)

!["Order details"](https://github.com/Kevinli296/jungle-rails/blob/master/docs/order_details.png?raw=true)