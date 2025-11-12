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
    sql_where: {% assign items = brand_category_item.filter._parameter_value | split: '..' %}
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
    {% endfor %} (
    {% for b in brand %}
      ${products.brand} = '{{ b }}' {% if forloop.last %}{% else %} OR {% endif %}
    {% else %} 1=1 {% endfor %} ) AND (
    {% for c in category %}
      {% assign g = c | split: "__" %}
        ${products.brand} = '{{ g[0] }}' AND ${products.category} = '{{ g[1] }}' {% if forloop.last %}{% else %} OR {% endif %}
    {% else %} 1=1 AND {% endfor %} ) AND (
    {% for i in item_name %}
      {% assign g = i | split: "__" %}
        ${products.brand} = '{{ g[0] }}'
    AND ${products.category} = '{{ g[1] }}'
    AND ${products.item_name} = '{{ g[2] }}' {% if forloop.last %}{% else %} OR {% endif %}
    {% else %} 1=1 {% endfor %} )

    ;;

    # ${products.brand} = '{{ g[0] }}' AND ${products.category} = '{{ g[1] }}' {% if forloop.last %}{% else %} OR {% endif %}


    # {% for i in item_name %}
    #     ${products.brand} = '{{ i[0] }}' AND ${products.category} = '{{ i[1] }}' AND ${products.item_name} = '{{ i[2] }}'
    # {% else %} 1=1 AND {% endfor %}
  }
}

view: brand_category_item {
  parameter: filter { type: unquoted hidden: no}
}
