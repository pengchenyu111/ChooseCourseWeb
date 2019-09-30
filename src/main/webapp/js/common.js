//$(function() {
//后期将会将常量保存在cookie中，如果cookie中没有，就从服务器中获取
var consts ={
		"STATUS_AWAITING_ORDER" : 0,
		"SUCCESS" : 1,
		"STATUS_ORDER_IN_PROCESSING" : 1,
		"STATUS_PAYMENT_CANCELLED" : 5,
		"STATUS_AWAITING_PAYMENT" : 2,
		"STATUS_ORDER_DISPATCHED" : 2,
		"STATUS_TRANSACTION_INCOMPLETE_CANCELLED_BY_SYSTEM" : 1,
		"STATUS_ORDER_DELIVERED" : 3,
		"STATUS_PAYMENT_FAILED" : 4,
		"shippingStatusArray" : [ "待处理", "处理中", "已发货", "已交付", "已退货", "订单已取消" ],
		"FAILED" : 0,
		"PAGE_SIZE" : 10,
		"ERROR" : -1,
		"paymentStatusArray" : [ "交易未完成", "交易不完整（由系统取消）", "等待付款", "付款成功",
				"付款失败", "付款已取消", "退款已付款" ],
		"STATUS_TRANSACTION_INCOMPLETE" : 0,
		"STATUS_PAYMENT_REFUNDED" : 6,
		"STATUS_PAYMENT_COMPLETED" : 3,
		"STATUS_ORDER_RETURNED" : 4
	};

function getPaymentStatusName(status){
	return consts.paymentStatusArray[status];
}
function getShippingStatusName(status){
	return consts.shippingStatusArray[status];
}
	/*
	//从服务器取到定义的系统通用常量
	var consts = null;
	$.ajax({
 	   "url":"../common/getConsts.do",
 	   "type":"POST",
 	   "dataType":"json",
 	   "success":function(obj){
 		   if(obj.state==1){
 			   consts = obj.data;
 			   console.log(consts);
 		   }else{
 			   alert(obj.message);
 		   }
 		   
 	   }
    });
    */
	
	/*	consts变量类似如下data内容：
	 * {"state":1,"message":"ok","data":{"STATUS_AWAITING_ORDER":0,"SUCCESS":1,"STATUS_ORDER_IN_PROCESSING":1,"STATUS_PAYMENT_CANCELLED":5,"STATUS_AWAITING_PAYMENT":2,"STATUS_ORDER_DISPATCHED":2,"STATUS_TRANSACTION_INCOMPLETE_CANCELLED_BY_SYSTEM":1,"STATUS_ORDER_DELIVERED":3,"STATUS_PAYMENT_FAILED":4,"shippingStatusArray":["待处理","处理中","已发货","已交付","已退货"],"FAILED":0,"PAGE_SIZE":10,"ERROR":-1,"paymentStatusArray":["交易未完成","交易不完整（由系统取消）","等待付款","付款成功","付款失败","付款已取消","退款已付款"],"STATUS_TRANSACTION_INCOMPLETE":0,"STATUS_PAYMENT_REFUNDED":6,"STATUS_PAYMENT_COMPLETED":3,"STATUS_ORDER_RETURNED":4}}
	 * 
	 */
//});