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
    sql_where:
    {% assign counter = 0 %}
    {% assign items = brand_category_item.filter._parameter_value | replace: "$", " " | split: '..' %}
    {% assign brand = "" | split: "" %}
    {% assign category = "" | split: "" %}
    {% assign item_name = "" | split: "" %}
    {% for item in items %}
      {% assign f = item | split: '__' %}
      {% assign item_arr = item | split: ".." %}
      {% if f.size == 1 %}
      {% assign brand = brand | concat: item_arr %}
      {% elsif f.size == 2 %}
      {% assign category = category | concat: item_arr  %}
      {% elsif f.size == 3 %}
      {% assign item_name = item_name | concat: item_arr %}
      {% endif %}
    {% endfor %}
    {% for b in brand %}
      {% if forloop.first %} ( {% endif %}
      {% assign counter = counter | plus: 1 %}
      ( ${products.brand} = '{{ b }}' ) {% if forloop.last %}{% else %} OR {% endif %}
      {% if forloop.last %} ) {% endif %}
    {% endfor %}
    {% for c in category %}
      {% if forloop.first %} {% if counter > 0 %} OR ( {% else %} ( {% endif %} {% endif %}
      {% assign counter = counter | plus: 1 %}
      {% if counter > 0 %}{% else %}{% endif %}
      {% assign g = c | split: "__" %}
      ( ${products.brand} = '{{ g[0] }}' AND ${products.category} = '{{ g[1] }}' ) {% if forloop.last %}{% else %} OR {% endif %}
    {% if forloop.last %} ) {% endif %}
    {% endfor %}
    {% for i in item_name %}
      {% if forloop.first %} {% if counter > 0 %} OR ( {% else %} ( {% endif %} {% endif %}
      {% assign counter = counter | plus: 1 %}
      {% assign g = i | split: "__" %}
      (       ${products.brand} = '{{ g[0] }}'
          AND ${products.category} = '{{ g[1] }}'
          AND ${products.item_name} = '{{ g[2] }}'
      )
    {% if forloop.last %} ) {% endif %}
    {% endfor %}
    {% if counter == 0 %} 1=1 {% endif %}
  ;;
  }
}

view: brand_category_item {
  parameter: filter { type: unquoted hidden: no}
}
