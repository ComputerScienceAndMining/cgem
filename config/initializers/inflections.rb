# Inflector#inflections now takes a locale as a parameter (defaults to :en)
ActiveSupport::Inflector.inflections('es-CL') do |inflect|
  inflect.plural(/$/, 's')
  inflect.plural(/([^aeéiou])$/i, '\1es')
  inflect.plural(/([aeiou]s)$/i, '\1')
  inflect.plural(/z$/i, 'ces')
  inflect.plural(/á([sn])$/i, 'a\1es')
  inflect.plural(/é([sn])$/i, 'e\1es')
  inflect.plural(/í([sn])$/i, 'i\1es')
  inflect.plural(/ó([sn])$/i, 'o\1es')
  inflect.plural(/ú([sn])$/i, 'u\1es')

  inflect.singular(/s$/, '')
  inflect.singular(/es$/, '')

  inflect.irregular('el', 'los')
end

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'API'
  inflect.irregular 'specimen', 'specimens'
end
