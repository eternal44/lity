module Devise
  module Strategies
    class Sponsor < Base

      def valid?
        params["sponsor"] || params["password"]
      end

      def authenticate!
        Get username and password
        username = params["username"]
        password = params["password"]

        # Try to login
        sponsor = Sponsor.find_by_username(username)

        if sponsor.nil?
          fail!("Sponsor login failed.")
        else
          if sponsor.valid_password?(password)
            success!(sponsor)
          else
            fail!("Invalid Password")
          end
        end
      end
    end
  end
end
