# typed: strong

class NilClass
  extend T::Sig

  sig { returns(T::Boolean) }
  def empty?; end

  sig { returns(T::Boolean) }
  def present?; end
end
