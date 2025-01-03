
with source as (

  select * from {{ source('production', 'product') }}

),

renamed as (
  
  select 
      productid as product_id,
      name,
      productnumber,
      makeflag,
      finishedgoodsflag,
      color,
      safetystocklevel,
      reorderpoint,
      standardcost,
      listprice,
      size,
      sizeunitmeasurecode,
      weightunitmeasurecode,
      weight,
      daystomanufacture,
      productline,
      class,
      style,
      productsubcategoryid as productsubcategory_id,
      productmodelid as productmodel_id,
      sellstartdate as sellstart_date,
      sellenddate as sellend_date,
      discontinueddate as discontinued_date,
      rowguid as rowgu_id,
      modifieddate as modified_date
      
  from source
  )
  
select * from renamed 