$(document).ready(function (){
    let $username=$("#name")
    let $password=$("#pwd")
    let $rpassword=$("#rpwd")
    let $phone=$("#phone")

    function getGender(){
        return $('input[name="gender"]:checked').val()
    }
    function getHobby() {
        var chk_val = [];
        $('input[name="hobby"]:checked').each(function (){
            chk_val.push($(this).val());
        })
        var hobby=chk_val.join(",")
        return hobby
    }
    function login(){
        console.log($username.val(),$password.val(),$phone.val())
        $.ajax({
            url:"http://"+ip+":8080/mall/user/userRegister",
            type:"POST",
            async: false,
            contentType:"application/json",
            data: JSON.stringify({
                username: $username.val(),
                password: $password.val(),
                phone: $phone.val()
            }),
            success:(res)=>{
                if (res.code==200){
                    alert("注册成功")
                    window.location = "./login.htm"
                }else {
                    alert("用户名重复，注册失败")
                }
            },
            error: (res) => {
                console.log("出错了");
            }
        })
    }
    function checkName(){
        if ($username.val().length<3){
            $("#nameInfo").html("用户名不得短于3位")
            return false
        }else {
            $("#nameInfo").html("")
            return true
        }
    }
    function checkPwd(){
        if ($password.val().length<6){
            $("#pwdInfo").html("密码不得短于6位")
            return false
        }else {
            $("#pwdInfo").html("")
            return true
        }
    }
    function checkRpwd(){
        if ($password.val()!=$rpassword.val()){
            $("#rpwdInfo").html("密码不一致")
            return false
        }else {
            $("#rpwdInfo").html("")
            return true
        }
    }
    function reset(){
        $username.val("")
        $password.val("")
        $rpassword.val("")
        $phone.val("")
    }
    $username.blur(function (){
        checkName()
    })
    $password.blur(function (){
        checkPwd()
        checkRpwd()
    })
    $rpassword.blur(function (){
        checkPwd()
        checkRpwd()
    })

    $("#submit").on('click',(event)=>{
        // console.log($username.val(),$password.val(),$rpassword.val())
        if (checkPwd()&&checkName()&&checkRpwd()){
            login()
        }else {
            alert("存在非法输入")
        }
    })
    $("#reset").on('click',(event)=>{
        reset()
    })

})
