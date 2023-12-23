if defined?(EmailValidator)
  EmailValidator.default_options.merge!(
      {
          allow_nil: false,
          domain: nil,
          require_fqdn: nil,
          mode: :loose
      }
  )
end