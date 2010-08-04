# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fbook_connect_session',
  :secret      => 'c832ccee5a4fec46760f899a99abfb3797c27b89967f0527a67968f69cfeefd75e6f7c58cb134b195d7823a5195cc24675caf840c97739568496aec979823782'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
