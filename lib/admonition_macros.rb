module AdmonitionMacro
  Redmine::WikiFormatting::Macros.register do
    desc "Adds a note to the wiki page:\n\n" +
      "<pre>\n" +
      "{{note(text with *wiki formatting*)}}\n" +
      "{{note\nAlternately, you can put blocks of *wiki-formatted* text here.\n}}\n" +
      "{{note(Or if you really want)\nYou can do both...\n}}\n" +
      "</pre>"
    macro :note, :parse_args => false do |obj, args, text|
      o = textilizable(args)
      if text.present?
        o << textilizable(text, :object => obj, :headings => false)
      end
      content_tag('div', o.html_safe, :class => "note")
    end

    desc "Variant of @note@."
    macro :info, :parse_args => false do |obj, args, text|
      o = textilizable(args)
      if text.present?
        o << textilizable(text, :object => obj, :headings => false)
      end
      content_tag('div', o.html_safe, :class => "info")
    end

    desc "Variant of @note@."
    macro :warning, :parse_args => false do |obj, args, text|
      o = textilizable(args)
      if text.present?
        o << textilizable(text, :object => obj, :headings => false)
      end
      content_tag('div', o.html_safe, :class => "warning")
    end

    desc "Variant of @note@."
    macro :alert, :parse_args => false do |obj, args, text|
      o = textilizable(args)
      if text.present?
        o << textilizable(text, :object => obj, :headings => false)
      end
      content_tag('div', o.html_safe, :class => "alert")
    end
  end

end
