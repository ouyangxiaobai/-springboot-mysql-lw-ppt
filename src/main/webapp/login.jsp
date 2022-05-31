<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>疫情网课教学平台</title>
    <link rel="stylesheet" href="assets/layui/css/layui.css">
    <script src="assets/js/jquery-3.2.1.js"></script>
    <script src="assets/js/md5.js"></script>
</head>
<body style="background-image: url(assets/images/login_bg.jpg);" class="layui-anim layui-anim-scale">

<div align="center">
    <div id="main-body" align="left" style="margin-top: 100px">
        <div align="center" style="width: 100%; margin-top: 30px;">

            <div style="width: 300px;" class="layui-anim layui-anim-up">
                <h2 style="margin-bottom: 30px;color: white;font-size:  24px;">疫情网课教学平台</h2>
                <form class="layui-form" action="" id="login-form">
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="margin-left: 0px;">
                            <input type="number" name="user_phone" required
                                   lay-verify="required" placeholder="请输入手机号" autocomplete="off" value="13155551111"
                                   class="layui-input">
                        </div>
                        <!-- <div class="layui-form-mid layui-word-aux"></div> -->
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="margin-left: 0px;">
                            <input type="password" name="user_password" required
                                   lay-verify="required" placeholder="请输入密码" autocomplete="off" value="111111"
                                   class="layui-input">
                        </div>
                        <!-- <div class="layui-form-mid layui-word-aux"></div> -->
                    </div>
                    <div class="layui-form-item" style="margin-top: 30px;">
                        <div class="layui-input-block" style="margin-left: 0px;">
                            <button class="layui-btn layui-btn-normal  " lay-submit
                                    lay-filter="login-form-commit" style="width: 300px;">登录
                            </button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<div style="text-align: center; clear: both;"></div>
<script src="assets/layui/layui.js"></script>
<script>
    (function ($) {

        layui.use('form', function () {
            var form = layui.form;

            //监听提交
            form.on('submit(login-form-commit)', function (data) {
                data.field.user_password = $.md5(data.field.user_password);

                if (data.field.user_phone.length == 11 && /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1})|)+\d{8})$/.test(data.field.user_phone)) {
                    $.ajax({
                        url: 'user/login.do',
                        data: data.field,
                        type: 'post',
                        success: function (result) {
                            if (result.success) {
                                layer.msg(result.msg || '登录成功');
                                parent.location.replace('index.jsp');
                            } else {
                                layer.msg(result.msg || '登录失败');
                            }
                        }
                    });
                } else {
                    layer.msg('手机号格式非法');
                }
                return false;
            });

        });


    })(window.jQuery);
</script>
</body>
</html>

