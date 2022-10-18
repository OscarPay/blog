module UsersHelper

    def ofuscate_email_address(email)
        email.split("@").first + "@*******.com"
    end
end
