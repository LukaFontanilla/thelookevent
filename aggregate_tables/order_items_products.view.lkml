include: "/models/thelook.model"
explore: +order_items {
  aggregate_table: rollup__products_brand__products_category__products_item_name {
    query: {
      dimensions: [products.brand, products.category, products.item_name]
    }
    materialization: {
      datagroup_trigger: ecommerce_etl_modified
    }
  }
  join: brand_category_item {
    sql:  ;;
    # sql_where: {% assign items = brand_category_item.filter._parameter_value | split: '..' %}
    # {% assign brand = [] %}
    # {% assign category = [] %}
    # {% assign item_name = [] %}
    # {% for item in items %}
    #   {{ item }}

    #   {% assign f = item | split: ' > ' %}{% if f.size == 1 %}
    #     {% brand | append: f %}
    #   {% elsif f.size == 2 %}
    #     {% category | append: f %}
    #   {% elsif f.size == 3 %}
    #     {% category | append: f %}
    #   {% endif %}
    #   {{ brand | join: "!"}}
    # {% else %} 1=1 {% endfor %}
    # ;;
    sql_where: {% assign items = brand_category_item.filter._parameter_value | split: '..' %}
    {% assign brand = "" | split: "" %}
    {% assign category = "" | split: "" %}
    {% assign item_name = "" | split: "" %}
    {% for item in items %}
      {% assign f = item | split: '__' %}
      {% if f.size == 1 %}
      {% assign brand = brand | concat: f | split: "" %}
      {% elsif f.size == 2 %}
      {% assign category = category | concat: f | split: "" %}
      {% elsif f.size == 3 %}
      {% assign item_name = item_name | concat: f | split: "" %}
      {% endif %}
    {{ brand }}
    {% else %} 1=1 {% endfor %}
    {% for b in brand %}
      ${products.brand} = '{{ b }}' {% forloop.last %}

    ;;
  }
}

view: brand_category_item {
  parameter: filter { type: unquoted hidden: yes}
}
