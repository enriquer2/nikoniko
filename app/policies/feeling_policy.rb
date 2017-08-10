# frozen_string_literal: true

class FeelingPolicy < ApplicationPolicy
  def index? # ver feelings si estas registrado y eres tu mismo
    return true if user_signed_in? && user == current_user
  end

  def create? # añadir feelings si estas registrado y eres tu usuario
    return true if user_signed_in? && user == current_user
  end

  def update? # añadir feelings si estas registrado y eres tu usuario
    return true if user_signed_in? && user == current_user
  end

  def destroy? # añadir feelings si estas registrado y eres tu usuario
    return true if user_signed_in? && user == current_user
  end
end
