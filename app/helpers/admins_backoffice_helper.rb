module AdminsBackofficeHelper
  def translate_attribute(object = nil, attribute = nil)
    if (object && attribute)
      object.model.human_attribute_name(attribute)
    else
      "Informe os parâmetros corretamente."
    end
  end
end
