# monkey patch to make remember_#{scope}_token cookie be ':httponly => true'
module Devise
  module Hooks
    module Rememberable
      def success!(resource)
        super
      
        if succeeded? && resource.respond_to?(:remember_me!) && remember_me?
          resource.remember_me!(extend_remember_period?)
      
          configuration = {
            :value => resource.class.serialize_into_cookie(resource),
            :expires => resource.remember_expires_at,
            :path => "/",
            :httponly => true
          }
      
          configuration[:domain] = resource.cookie_domain if resource.cookie_domain?
          cookies.signed["remember_#{scope}_token"] = configuration
          
        end
      end
    end
  end
end

# module Devise
#   module Hooks
#     module Rememberable
#       alias :old_success! :success!
#       
#       def success!(resource)
#         configuration = old_success!(resource)
#       
#         if succeeded? && resource.respond_to?(:remember_me!) && remember_me?
#           configuration[:domain] = resource.cookie_domain if resource.cookie_domain?
#           cookies.signed["remember_#{scope}_token"] = configuration.merge( :httponly => true )
#         end
#       end
#     end
#   end
# end