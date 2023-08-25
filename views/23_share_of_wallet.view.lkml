view: order_items_share_of_wallet {
  view_label: "Share of Wallet"
  #
  #   - measure: total_sale_price
  #     type: sum
  #     value_format: '$#,###'
  #     sql: ${sale_price}
  #


  ########## Comparison for Share of Wallet ##########

  filter: item_name {
    label: "Item Name"
    view_label: "Share of Wallet (Item Level)"
    suggest_dimension: products.item_name
    suggest_explore: orders_with_share_of_wallet_application
  }

  filter: brand {
    label: "Brand"
    view_label: "Share of Wallet (Brand Level)"
    suggest_dimension: products.brand
    suggest_explore: orders_with_share_of_wallet_application
  }

  dimension: primary_key {
    label: "Primary Key"
    sql: ${order_items.id} ;;
    primary_key: yes
    hidden: yes
  }

  dimension: item_comparison {
    label: "Item Comparison"
    view_label: "Share of Wallet (Item Level)"
    description: "Compare a selected item vs. other items in the brand vs. all other brands"
    sql: CASE
      WHEN {% condition item_name %} rtrim(ltrim(products.item_name)) {% endcondition %}
      THEN concat('(1) ',${products.item_name})
      WHEN  {% condition brand %} rtrim(ltrim(products.brand)) {% endcondition %}
      THEN concat('(2) Rest of ', ${products.brand})
      ELSE '(3) Rest of Population'
      END
       ;;
  }

  dimension: brand_comparison {
    label: "Brand Comparison"
    view_label: "Share of Wallet (Brand Level)"
    description: "Compare a selected brand vs. all other brands"
    sql: CASE
      WHEN  {% condition brand %} rtrim(ltrim(products.brand)) {% endcondition %}
      THEN concat('(1) ',${products.brand})
      ELSE '(2) Rest of Population'
      END
       ;;
  }

  measure: total_sale_price_this_item {
    label: "Total Sale Price This Item"
    view_label: "Share of Wallet (Item Level)"
    type: sum
    hidden: yes
    sql: ${order_items.sale_price} ;;
    value_format_name: usd

    filters: {
      field: order_items_share_of_wallet.item_comparison
      value: "(1)%"
    }
  }

  measure: total_sale_price_this_brand {
    label: "Total Sale Price This Brand"
    view_label: "Share of Wallet (Item Level)"
    type: sum
    hidden: yes
    value_format_name: usd
    sql: ${order_items.sale_price} ;;

    filters: {
      field: order_items_share_of_wallet.item_comparison
      value: "(2)%,(1)%"
    }
  }

  measure: total_sale_price_brand_v2 {
    view_label: "Share of Wallet (Brand Level)"
    label: "Total Sales - This Brand"
    type: sum
    value_format_name: usd
    sql: ${order_items.sale_price} ;;

    filters: {
      field: order_items_share_of_wallet.brand_comparison
      value: "(1)%"
    }
  }

  measure: item_share_of_wallet_within_brand {
    view_label: "Share of Wallet (Item Level)"
    type: number
    description: "This item sales over all sales for same brand"
    #     view_label: 'Share of Wallet'
    value_format_name: percent_2
    sql: ${total_sale_price_this_item}*1.0 / nullif(${total_sale_price_this_brand},0) ;;
  }

  measure: item_share_of_wallet_within_company {
    view_label: "Share of Wallet (Item Level)"
    description: "This item sales over all sales across website"
    value_format_name: percent_2
    #     view_label: 'Share of Wallet'
    type: number
    sql: ${total_sale_price_this_item}*1.0 / nullif(${order_items.total_sale_price},0) ;;
  }

  measure: brand_share_of_wallet_within_company {
    view_label: "Share of Wallet (Brand Level)"
    description: "This brand's sales over all sales across website"
    value_format_name: percent_2
    #     view_label: 'Share of Wallet'
    type: number
    sql: ${total_sale_price_brand_v2}*1.0 / nullif(${order_items.total_sale_price},0) ;;
  }
}
