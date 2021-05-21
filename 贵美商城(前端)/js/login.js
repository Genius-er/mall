$(()=>{
  if (window.localStorage.getItem('token')){
    window.location.replace("./login_success.htm");
  }else {
    $("#login_btn").click(()=>{
      let username = $(".login_list input").eq(0).val();
      let password = $(".login_list input").eq(1).val();

      console.log(username,username);

      $.ajax({
        url: "http://" + ip + ":8080/mall/user/userLogin",
        type:"post",
        async: false,
        contentType: "application/json",
        data:JSON.stringify({
          username: username,
          password: password
        }),
        success: (data) => {
          console.log(data.data.token);
          if (data.code === "200"){
            console.log("登录成功");
            window.localStorage.setItem("username", username);
            window.localStorage.setItem("token", data.data.token);
            window.location.replace("./login_success.htm");
          }else{
            console.log("登录失败");
          }
        },
        error: () => {
          console.log("出错了");
        }

      })

    })
  }

})
