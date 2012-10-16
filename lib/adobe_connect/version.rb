module AdobeConnect
  class Version
    MAJOR = 0 unless defined? AdobeConnect::MAJOR
    MINOR = 1 unless defined? AdobeConnect::MINOR
    PATCH = 0 unless defined? AdobeConnect::PATCH
    PRE = nil unless defined? AdobeConnect::PRE

    class << self
      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end
    end
  end
end