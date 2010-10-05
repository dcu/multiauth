if defined?(ApplicationController)
  ApplicationController.send(:include, Multiauth::Helpers)
end