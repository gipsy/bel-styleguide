# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Bellroy::Application.config.secret_token = 'change_this_to_appropriate'  if defined?(Bellroy::Application)
Bellroy::Application.config.secret_key_base = 'change_this_to_appropriate'  if defined?(Bellroy::Application)
