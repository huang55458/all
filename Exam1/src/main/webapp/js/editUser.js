var login_name=null;

$(function(){
    login_name = $("#login_name");


    //初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
    login_name.next().html("*");
})

login_name.on("focus",function(){
    validateTip(login_name.next(),{"color":"#666666"},"* 请输入登录名称",false);
}).on("blur",function(){
    if(login_name.val() != null && login_name.val() != ""){
        validateTip(login_name.next(),{"color":"green"},imgYes,true);
    }else{
        validateTip(login_name.next(),{"color":"red"},imgNo+" 登录名称不能为空，请重新输入",false);
    }

});