view: products {
  sql_table_name: looker-private-demo.ecomm.products ;;
  view_label: "Products"

  ### DIMENSIONS ###

  dimension: id {
    primary_key: yes
    label: "ID"
    description: "Unique identifier for the product."
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    label: "Brand"
    description: "Product Brand"
    sql: TRIM(${TABLE}.brand) ;;
    drill_fields: [item_name]
    case_sensitive: no
    link: {
      label: "Website"
      url: "http://www.google.com/search?q={{ value | encode_uri }}+clothes&btnI"
      icon_url: "http://www.google.com/s2/favicons?domain=www.{{ value | encode_uri }}.com"
    }
    link: {
      label: "Facebook"
      url: "http://www.google.com/search?q=site:facebook.com+{{ value | encode_uri }}+clothes&btnI"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/c/c2/F_icon.svg"
    }
    link: {
      label: "{{value}} Analytics Dashboard"
      url: "/dashboards/1948?Brand%20Name={{ value | encode_uri }}"
      icon_url: "https://www.seekpng.com/png/full/138-1386046_google-analytics-integration-analytics-icon-blue-png.png"
    }

    action: {
      label: "Email Brand Promotion to Cohort"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Last Chance! 20% off {{ value }}"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Dear Valued Customer,

        We appreciate your continue support and loyalty and wanted to show our appreciation. Offering a 15% discount on ALL products for our favorite brand {{ value }}.
        Just used code {{ value | upcase }}-MANIA on your next checkout!

        Your friends at the Look"
      }
    }
    action: {
      label: "Start Adwords Campaign"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        type: select
        name: "Campaign Type"
        option: { name: "Spend" label: "Spend" }
        option: { name: "Leads" label: "Leads" }
        option: { name: "Website Traffic" label: "Website Traffic" }
        required: yes
      }
      form_param: {
        name: "Campaign Name"
        type: string
        required: yes
        default: "{{ value }} Campaign"
      }

      form_param: {
        name: "Product Category"
        type: string
        required: yes
        default: "{{ value }}"
      }

      form_param: {
        name: "Budget"
        type: string
        required: yes
      }

      form_param: {
        name: "Keywords"
        type: string
        required: yes
        default: "{{ value }}"
      }
    }
  }

  dimension: category {
    label: "Category"
    description: "The category the product belongs to."
    sql: TRIM(${TABLE}.category) ;;
    drill_fields: [department, brand, item_name]
    case_sensitive: no
  }

  dimension: department {
    label: "Department"
    description: "The department the product belongs to."
    sql: TRIM(${TABLE}.department) ;;
  }

  dimension: distribution_center_id {
    label: "Distribution Center ID"
    description: "The ID of the distribution center storing this product."
    type: number
    sql: CAST(${TABLE}.distribution_center_id AS INT64) ;
  }

  dimension: item_name {
    label: "Item Name"
    description: "The name of the item."
    sql: TRIM(${TABLE}.name) ;;
    drill_fields: [id]
    case_sensitive: no
  }

  dimension: retail_price {
    label: "Retail Price"
    description: "The standard retail price of the product."
    type: number
    sql: ${TABLE}.retail_price ;;
    action: {
      label: "Update Price"
      url: "https://us-central1-sandbox-trials.cloudfunctions.net/ecomm_inventory_writeback"
      param: {
        name: "Price"
        value: "24"
      }
      form_param: {
        name: "Discount"
        label: "Discount Tier"
        type: select
        option: {
          name: "5% off"
        }
        option: {
          name: "10% off"
        }
        option: {
          name: "20% off"
        }
        option: {
          name: "30% off"
        }
        option: {
          name: "40% off"
        }
        option: {
          name: "50% off"
        }
        default: "20% off"
      }
      param: {
        name: "retail_price"
        value: "{{ retail_price._value }}"
      }
      param: {
        name: "inventory_item_id"
        value: "{{ inventory_items.id._value }}"
      }
      param: {
        name: "product_id"
        value: "{{ id._value }}"
      }
      param: {
        name: "security_key"
        value: "googledemo"
      }
    }
  }

  dimension: sku {
    label: "SKU"
    description: "The Stock Keeping Unit (SKU) identifier."
    sql: ${TABLE}.sku ;;
  }

  ## MEASURES ##

  measure: count {
    label: "Count"
    description: "Count of products."
    type: count
    drill_fields: [detail*]
  }

  measure: brand_count {
    label: "Brand Count"
    description: "Count of distinct brands."
    type: count_distinct
    sql: ${brand} ;;
    drill_fields: [brand, detail2*, -brand_count] # show the brand, a bunch of counts (see the set below), don't show the brand count, because it will always be 1
  }

  measure: category_count {
    label: "Category Count"
    description: "Count of distinct categories."
    alias: [category.count]
    type: count_distinct
    sql: ${category} ;;
    drill_fields: [category, detail2*, -category_count] # don't show because it will always be 1
  }

  measure: department_count {
    label: "Department Count"
    description: "Count of distinct departments."
    alias: [department.count]
    type: count_distinct
    sql: ${department} ;;
    drill_fields: [department, detail2*, -department_count] # don't show because it will always be 1
  }

  measure: prefered_categories {
    hidden: yes
    label: "Prefered Categories"
    description: "List of preferred categories."
    type: list
    list_field: category
    #order_by_field: order_items.count

  }

  measure: prefered_brands {
    hidden: yes
    label: "Prefered Brand"
    description: "List of preferred brands."
    type: list
    list_field: brand
    #order_by_field: count
  }

  set: detail {
    fields: [id, item_name, brand, category, department, retail_price, customers.count, orders.count, order_items.count, inventory_items.count]
  }

  set: detail2 {
    fields: [category_count, brand_count, department_count, count, customers.count, orders.count, order_items.count, inventory_items.count, products.count]
  }
}
