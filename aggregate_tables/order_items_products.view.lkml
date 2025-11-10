explore: +order_items {
  aggregate_table: rollup__products_brand__products_category__products_item_name {
    query: {
      dimensions: [products.brand, products.category, products.item_name]
    }
    materialization: {
      datagroup_trigger: ecommerce_etl_modified
    }
  }
}
