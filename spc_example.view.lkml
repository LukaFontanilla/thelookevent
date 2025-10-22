view: spc_example {
  sql:
  WITH spc_dataset AS
(SELECT d.*,s.EXVAL_03 -- EXVAL03 is the operation description of a sample (1 of 20 extractor Keys that Camline uses to give context to samples)



FROM `entegris-p-dao-idh-mc.IDH_MART.space_details` d -- Data source of serial-level data in GCP



inner join `entegris-p-dao-caml.BIL_CAMLINE_RAW_LAYER.T_EXT_SAMPLES` s -- Data source of batch-level data which includes all extractor keys



on d.sample_id = s.SAMPLE_ID --primary key to connect sources



where s.EXVAL_03 = ({% parameter operation_description %}) --defines "operation description" as the group flow rate tracking



and d.parameter_name = ({% parameter parameter_name %}) --defines the test value of interest (this is the value that goes on our COA)



and d.product_family = ({% parameter product_family %}) and d.pore_size = ({% parameter pore_size %}) and d.pleat_configuration = ({% parameter pleat_configuration %}) and d.length = {% parameter pore_size %} -- 4 different pore sizes, but otherwise equivalent products from a flow rate perspective.
)

SELECT d.batch as batch, average(spc_number) as batch_mean FROM spc_dataset ORDER BY d.batch DESC LIMIT 30

} ;;

parameter: operation_description {
  type: unquoted
}

parameter: parameter_name {
  type: unquoted
}

parameter: product_family {
  type: unquoted
}

parameter: pore_size {
  type: unquoted
}

parameter: pleat_configuration {
  type: unquoted
}

parameter: length {
  type: unquoted
}

dimension: batch {
  sql: ${TABLE},batch ;;
}

dimension: batch_mean {
  type: number
  sql: ${TABLE}.batch_mean ;;
}

measure: mean_of_means {
  type: average
  sql: ${batch_mean} ;;
  value_format_name: decimal_2
}

measure: sigma {
  type: number
  sql: stddev_samp(${batch_mean} ;;
  value_format_name: decimal_2
}

measure: ucl {
  label: "Upper Control Limit"
  sql: ${mean_of_means} + 3 * ${sigma}  ;;
  value_format_name: decimal_2
}

  measure: lcl {
    label: "Lower Control Limit"
    sql: ${mean_of_means} - 3 * ${sigma}  ;;
    value_format_name: decimal_2
  }

}
