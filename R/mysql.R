

#' 查询相关数据
#'
#' @param token 口令
#' @param sql sql
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mysql_select()
mysql_select <- function(token='9B75043D-8462-4D36-9B29-6D2EF4F3C2F3',sql = "select * from rds_crm_sales_saleOrder_api") {
  tsda::set_py()
  rds <-  reticulate::import('pyrda.dbms.rds')
  app = rds$RdMySql(token='9B75043D-8462-4D36-9B29-6D2EF4F3C2F3')
  data = app$select(sql)

  ncount  = length(data)
  if(ncount >0){
    res_list =  lapply(1:ncount, function(i){
      item = data[[i]]
      res = data.frame(item,stringsAsFactors = F)
      return(res)
    })
    data = do.call('rbind',res_list)
  }else{
    data = data
  }

  return(data)
}
