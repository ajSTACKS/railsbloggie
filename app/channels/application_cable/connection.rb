module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def guest_user
      guest = GuestUser.new
      guest.id = guest.object_id
      guest.name = "Guest User"
      guest.first_name = "Guest"
      guest.last_name = "User"
      guest.email = "guest@user.com"
      guest
    end

    def connect
      #when connection occurs i want this to print sp we can track user
      self.current_user = find_verified_user || guest_user
      logger.add_tags 'ActionCable', current_user.email
      logger.add_tags 'ActionCable', current_user.id
    end
     protected

    def find_verified_user
      #hey devise were not really to able ask you in a normal way can you let us knw if the current user is logged in or not
      if verified_user = env['warden'].user
        verified_user
      end
    end
  end
end
