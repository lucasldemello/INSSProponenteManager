module ApplicationHelper
  def brazilian_states_options
    [
      ['AC', 'AC'],
      ['AL', 'AL'],
      ['AP', 'AP'],
      ['AM', 'AM'],
      ['BA', 'BA'],
      ['CE', 'CE'],
      ['DF', 'DF'],
      ['ES', 'ES'],
      ['GO', 'GO'],
      ['MA', 'MA'],
      ['MT', 'MT'],
      ['MS', 'MS'],
      ['MG', 'MG'],
      ['PA', 'PA'],
      ['PB', 'PB'],
      ['PR', 'PR'],
      ['PE', 'PE'],
      ['PI', 'PI'],
      ['RJ', 'RJ'],
      ['RN', 'RN'],
      ['RS', 'RS'],
      ['RO', 'RO'],
      ['RR', 'RR'],
      ['SC', 'SC'],
      ['SP', 'SP'],
      ['SE', 'SE'],
      ['TO', 'TO']
    ]
  end

  def phone_type_options
    [
      ['Celular', 0],
      ['Telefone Fixo', 1],
      ['Telefone de Referência', 2]
    ]
  end
end
