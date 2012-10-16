module AdobeConnect
  module Errors
    class AdobeConnectError     < StandardError; end
    class UnauthorizedError     < AdobeConnectError; end
    class GeneralError          < AdobeConnectError; end
    class AccessDeniedError     < AdobeConnectError; end
    class AuthenticationError   < AdobeConnectError; end
    class CookieNotFound        < AdobeConnectError; end
    class InvalidCookie         < AdobeConnectError; end
  end
end