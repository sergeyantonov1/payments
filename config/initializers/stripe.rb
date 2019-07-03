require "stripe"

Stripe.api_key = ENV.fetch("STRIPE_API_KEY")
Stripe.api_version = "2019-05-16"
