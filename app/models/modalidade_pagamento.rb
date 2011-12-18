class ModalidadePagamento < ActiveRecord::Base
  has_many :users

  validates_presence_of :nome, :message => "da modalidade em branco."

  validates_presence_of :preco, :message => "da modalidade em branco. Introduza o preco (ex: 30.00 euros)."
  validates_format_of :preco, :message => "introduzido e invalido. Introduza o preco (ex: 30.00 euros).",
    :with => /^(\d)+[.]\d$/,
    :unless => Proc.new { |modalidade| modalidade.preco.blank? }

end

