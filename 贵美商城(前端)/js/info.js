console.log("info.js");
let proId = getUrlParam("proId");
getProductInfo(proId);
$(() => {
  console.log(proId);
  setProductInfo();
});





/**
 * 获取当前页面url中指定参数
 * @param name 参数名
 * @returns {string|null} 有值返回值，无该参数返回null
 */
function getUrlParam(name) {
  let reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
  let url = window.location;
  console.log(url);
  let r = window.location.search.substr(1).match(reg);
  if (r != null) {
    console.log(unescape(r[2]));
    return unescape(r[2]);
  }
  return null;
}

/**
 * 根据指定商品id获取ProductInfo放进session中,key:productInfo
 * @param proId
 */
function getProductInfo(proId) {
  $.ajax({
    url: "http://" + ip + ":8080/mall/product/getProductInfo",
    type: "post",
    async: false,
    contentType: "application/json",
    data: JSON.stringify({
      proId: proId
    }),
    success: (data) => {
      if (data.code === "200") {
        console.log("获取数据成功");
        console.log(data.data);
        window.sessionStorage.setItem('productInfo', JSON.stringify(data.data));
      } else {
        console.log("获取数据失败");
      }
    },
    error: () => {
      console.log("出错了");
    }
  });
}

/**
 * 将获取的商品信息显示在页面上
 */
function setProductInfo() {
  let productInfo = window.sessionStorage.getItem('productInfo');
  let productInfoObj = JSON.parse(productInfo);
  console.log("productInfoObj:", productInfoObj);

  // 从对象中结构出需要的信息
  let {price, name, stock, mainImage} = productInfoObj;
  console.log(price, name, stock, mainImage);

  //将指定信息放到指定位置
  // $(`<h1>${name}</h1>`).before($("#show"));
  $("#show").before(`<h1>${name}</h1>`)
  $(`<span>${price}元 </span>`).appendTo("#price");
  $(`<span>${stock}件</span>`).appendTo("#stock");
  $("#bigImg").attr("src",`http://${ip}:8080/mall${mainImage}`)

}
