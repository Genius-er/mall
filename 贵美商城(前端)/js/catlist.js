$(document).ready(function (){
    //从url中分离获取参数
    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
    })(jQuery);

    var id=$.getUrlParam("cateId")
    console.log(id)

    // function append(){
    //
    //     let productId="2"
    //     let productName="SKS之29杀真相"
    //     let productInfo="那个男人真的开了挂"
    //     let seller="卢本伟"
    //     let productPrice="3700W"
    //
    //     $("#checkboxUl").append("<li><input type=\"checkbox\" /></li>\t")
    //     $("#nameUl").append("<li><a href='info.htm?id="+productId+"'>"+productName+"</a></li>")
    //     console.log(productId)
    //     $("#sellerPhoneUl").append("<li><a href='info.htm?id="+productId+"'>"+productInfo+"</a><br />出售者：<a href=\"#\">"+seller+"<br /><a href=\"#\"><img src=\"images/contactme.gif\" alt=\"alt\" /> <img src=\"images/addfav.gif\" alt=\"收藏\" />收藏</a></li>")
    //     $("#priceUl").append("<li>一口价：<br />"+productPrice+"</li>")
    // }
    // append()

    function getList(){

        $.ajax({
            url:"http://"+ip+":8080/mall/product/getProductsByCateId",
            type:"POST",
            contentType:"application/json",
            data:JSON.stringify({
                cateId:id
            }),
            success:(res)=>{
                if (res.code==200){
                    for (let each in res.data){
                        console.log(res.data[each])
                        let productId=res.data[each]["proId"]
                        let productName=res.data[each]["name"]
                        let productInfo=res.data[each]["detail"]
                        let productPrice=res.data[each]["price"]
                        let mainImage=res.data[each]["mainImage"]
                        // console.log(productId)

                            $("#checkboxUl").append("<li><input type=\"checkbox\" /></li>\t")
                            $("#nameUl").append(`<li>
           
                                                      <a href='info.htm?proId=${productId}'>
                                                        <img src="http://${ip}:8080/mall${mainImage}" alt="alt" style="width: 80px;height: 80px"/>
                                                    <span>${productName}</span></a>
                   
                                                   </li>`
                                                      )
                            $("#sellerPhoneUl").append("<li><a href='info.htm?proId="+productId+"'>"+productInfo+"</a><br />出售者：<a href=\"#\">马保国<br /><a href=\"#\"><img src=\"images/contactme.gif\" alt=\"alt\" /> <img src=\"images/addfav.gif\" alt=\"收藏\" />收藏</a></li>")
                        $("#priceUl").append("<li>一口价：<br />" + productPrice + "</li>");
                        `<li><a href='info.htm?proId=${productId}'>${productName}</a></li>`
                    }
                }else {
                    alert("请求失败")
                }
            }
        })
    }


    getList()
})
