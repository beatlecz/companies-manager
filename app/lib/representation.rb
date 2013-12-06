module Representation

  def as(template_name, opts={})
    const_name = "#{self.class.to_s}#{template_name.to_s.to_const_name}Representer"

    Object.const_get(const_name).represent self, opts
  end

end