# typed: false

class ApplicationController
  extend T::Sig

  sig { returns(T::Hash[Integer]) }
  def session; end
end
