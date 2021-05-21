/*
<li class="pic btn txt"><a href="login.htm" target="_parent">登录</a></li>
<li class="pic btn txt"><a href="register.htm" target="_parent">注册</a></li>
*/

$(() => {
  getAllFirstCate()

  let username = window.localStorage.getItem('username');
  if(username&&window.localStorage.getItem('token')){
    $(`<li class="pic btn txt logout"><a id="logout" href="javascript:;" target="_parent"">注销</a></li>`).appendTo(".menu ul");
    $(`<span id="usernameSpan">${username}<span>`).appendTo(".hello span");
    $("#logout").click(() => {
      if (confirm("是否确定注销？")) {
        $.ajax({
          url: "http://" + ip + ":8080/mall/user/userLogout",
          type: "post",
          async: false,
          contentType: "application/json",
          headers: {
            token: window.localStorage.getItem("token")
          },
          success: (data) => {
            if (data.code === "200") {
              console.log("注销成功");
              window.localStorage.removeItem('username');
              window.localStorage.removeItem('token');
              $(".menu ul li").remove(".logout");
              $(`<li class="pic btn txt"><a href="login.htm" target="_parent">登录</a></li>
                <li class="pic btn txt"><a href="register.htm" target="_parent">注册</a></li>`).appendTo(".menu ul");
              $(".hello span").remove("#usernameSpan")
            } else {
              console.log("注销失败");
            }
          },
          error: () => {
            console.log("出错了");
          }

        });
      }
    });
  }else {
    $(`<li class="pic btn txt"><a href="login.htm" target="_parent">登录</a></li>
    <li class="pic btn txt"><a href="register.htm" target="_parent">注册</a></li>`).appendTo(".menu ul")
  }
});


/**
 * 初始化header里的一级分类项
 */
function getAllFirstCate() {
  /*let allCategories = `[
  {
    "secondCategory": [
      {
        "cateId": 5,
        "name": "冰箱"
      }
    ],
    "cateId": 1,
    "name": "家用电器"
  },
  {
    "secondCategory": [],
    "cateId": 2,
    "name": "手机数码"
  },
  {
    "secondCategory": [],
    "cateId": 3,
    "name": "日用百货"
  },
  {
    "secondCategory": [
      {
        "cateId": 10,
        "name": "科幻小说"
      }
    ],
    "cateId": 4,
    "name": "书籍"
  }
]`;*/
  let allCategories = window.sessionStorage.getItem('allCategories')
  let allCategoriesObj = JSON.parse(allCategories);
  // console.log(allCategoriesObj);
  let allFirstCate = [];
  for (let i in allCategoriesObj) {
    let {name, cateId} = allCategoriesObj[i];
    // console.log(name, cateId);
    // console.log({name, cateId});
    allFirstCate.push({name, cateId})
  }
  // console.log(allFirstCate);
  let tags = ''
  /*
    <li><a href="catlist.htm" target="_parent">家用电器</a></li>
    <li><a href="catlist.htm" target="_parent">手机数码</a></li>
    <li><a href="catlist.htm" target="_parent">日用百货</a></li>
    <li><a href="catlist.htm" target="_parent">&nbsp;书&nbsp;&nbsp;&nbsp;籍&nbsp;</a></li>
  * */
  for (let i in allFirstCate) {
    let {name, cateId} = allFirstCate[i];
    // console.log(name, cateId);
    tags += `<li><a href="catlist.htm?cateId=${cateId}" target="_parent">${allFirstCate[i].name}</a></li>`;
  }

  // console.log(tags);

  $("#mainPage").after(tags);



}

