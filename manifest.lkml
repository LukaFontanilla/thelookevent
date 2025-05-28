project_name: "thelook_event"

localization_settings: {
  default_locale: en
  localization_level: permissive
}

application: simple_extension {
  label: "Simple Extension"
  url: "https://hosted-guided-g-membrane.trycloudflare.com/bundle.js"
  # file: "bundle.js"
  entitlements: {
    core_api_methods: ["me"]
  }
}
