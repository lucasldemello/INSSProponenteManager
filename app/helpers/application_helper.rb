module ApplicationHelper
  def brazilian_states_options
    [
      %w[AC AC],
      %w[AL AL],
      %w[AP AP],
      %w[AM AM],
      %w[BA BA],
      %w[CE CE],
      %w[DF DF],
      %w[ES ES],
      %w[GO GO],
      %w[MA MA],
      %w[MT MT],
      %w[MS MS],
      %w[MG MG],
      %w[PA PA],
      %w[PB PB],
      %w[PR PR],
      %w[PE PE],
      %w[PI PI],
      %w[RJ RJ],
      %w[RN RN],
      %w[RS RS],
      %w[RO RO],
      %w[RR RR],
      %w[SC SC],
      %w[SP SP],
      %w[SE SE],
      %w[TO TO]
    ]
  end

  def phone_type_options
    [
      ['Celular', '0'],
      ['Telefone Fixo', '1'],
      ['Telefone de Referência', '2']
    ]
  end
end
