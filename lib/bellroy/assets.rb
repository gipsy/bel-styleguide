require "bellroy/version"
require "bellroy/url_encryptor"

module Bellroy::Assets

  def self.precompile
    [
      'core.css',
      'core_ie.css',
      'core_fixed_width.css',
      'core_legacy.css',
      'core_legacy_ie.css',
      'omniture/s_code.js',
      'prism.js',
      'prism.css',
      'icons/active.css',
      'icons/critical.css',
      'fonts.css',
      "fonts_woff2.css",
      'styleguide.css',
      'requirejs/require.js',
    ]
  end

  def self.precompile_as_engine
    [
      'core.css',
      'core_ie.css',
      'core_fixed_width.css',
      'omniture/s_code.js',
      'requirejs/require.js',
      'icons/active.css',
      'icons/critical.css',
      "fonts.css",
      "fonts_woff2.css"
    ]
  end

end
