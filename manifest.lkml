project_name: "thelook_event"

localization_settings: {
  default_locale: en_US
  localization_level: permissive
}

visualization: {
  id: "meken-custom-vis"
  label: "Murat's Custom Bars"
  file: "visualizations/basic_custom_vis.js"
  dependencies: [
    "https://code.jquery.com/jquery-2.2.4.min.js",
    "https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.9.1/underscore-min.js",
    "https://cdnjs.cloudflare.com/ajax/libs/d3/4.13.0/d3.js"
  ]
}
