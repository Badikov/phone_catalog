module WithAndWithoutJSHelper

  def with_and_without_js(&block)
    [true, false].each do |js_enabled|
      context "when javascript #{js_enabled ? 'enabled' : 'disabled'}", js: js_enabled do
        module_eval(&block)
      end
    end
  end
end