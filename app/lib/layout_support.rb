module LayoutSupport

  def layout_defaults
    {
      about:          true,
      ads_header:     true,
      ads_footer:     false,
      include_js:     true,
      languages:      true,
      nav_primary:    true,
      search:         true,
      nav_sitemap:    true,
      tynt:           true,
      user_nav:       true,
      responsive:     true,
      third_party:    false,
      legacy_bl:      false,
      app_core:       false,
      legacy_header:  false,
      default_title:  true
    }
  end

  def layout_options
    {
      india: {
        about:          false,
        ads_header:     true,
        include_js:     true,
        nav_primary:    false,
        search:         false,
        nav_sitemap:    false,
        user_nav:       false,
        tynt:           false,
        third_party:    true,
        app_core:       true,
        default_title:  false,
        legacy_header:  true
      },
      modern: {
        app_core:       true,
        default_title:  false
      },
      external: {
        default_title:  false
      },
      responsive: {
        app_core:       true
      },
      noscript: {
        include_js:     false,
        tynt:           false,
        legacy_bl:      true,
        responsive:     false,
        secure:         true
      },
      secure: {
        tynt:           false,
        secure:         true,
        legacy_bl:      true,
        responsive:     false
      },
      secure_responsive: {
        tynt:           false,
        secure:         true,
        legacy_bl:      true
      },
      client_solutions: {
        include_js:     false,
        user_nav:       false,
        nav_sitemap:    false,
        ads_header:     false
      },
      styleguide: {
        tynt:           false
      },
      legacy: {
        responsive:     false,
        legacy_bl:      true
      },
      legacy_responsive: {
        legacy_bl:      true
      }
    }
  end

  def get_layout_config(layout_type)
    if layout_options[:"#{layout_type}"]
      layout_defaults.merge(layout_options[:"#{layout_type}"])
    else
      layout_defaults
    end
  end

  def get_layout(route)
    if route == "responsive" || route == "minimal"
      return {
        layout: route,
        template: "layouts/examples/#{route}"
      }
    elsif route == "fixed-width"
      return {
        layout: 'responsive',
        template: "layouts/examples/responsive"
      }
    end

    {
      layout: false,
      template: "layouts/custom/preview"
    }
  end

end
