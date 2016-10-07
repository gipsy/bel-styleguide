$: << 'lib'
require "bellroy/version"
require "bellroy/url_encryptor"
require "bellroy/url_validator"
require "bellroy/assets"

module Bellroy

end

require "bellroy/engine" if defined?(Rails)

