module ApplicationHelper
  def editable(obj, attr, options={})
    type = options[:type] || 'text'
    field_name = "field-#{obj.send(attr)}"
    update_url = options[:url] || url_for(obj)
    case type
    when 'text'
      tag = text_field_tag(field_name, obj.send(attr), data: { 'hello-target' => 'attr', 'action' => 'change->hello#autosave' })
    when 'date'
      tag = date_field_tag(field_name, obj.send(attr), data: { 'hello-target' => 'attr', 'action' => 'change->hello#autosave' })
    when 'select'
      select_options = options[:options]
      selected = options[:selected] || obj.send(attr)

      tag = select_tag('select', options_for_select(select_options, selected), data: { 'hello-target' => 'attr', 'action' => 'change->hello#autosave' })
    end

    html = <<~HTML
<div data-controller="hello" data-id=#{obj.id} data-url=#{update_url} data-field=#{attr}>
  #{tag}
</div>
    HTML

    html.html_safe
  end
end
