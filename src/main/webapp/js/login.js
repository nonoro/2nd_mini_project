$(document).ready(function () {
    let signup = $(".links").find("li").find("#signup");
    let signin = $(".links").find("li").find("#signin");
    let reset = $(".links").find("li").find("#reset");
    let first_input = $("form").find(".first-input");
    let hidden_input1 = $("form").find(".input__block").find("#email");
    let hidden_input2 = $("form").find(".input__block").find("#userAddr");
    let hidden_input3 = $("form").find(".input__block").find("#phone");
    let hidden_input4 = $("form").find(".input__block").find("#profile");
    let hidden_input5 = $("form").find(".input__block").find("#dogName");
    let hidden_input6 = $("form").find(".input__block").find("#dogBirthday");
    let signin_btn = $("form").find(".signin__btn");

  /*  hidden_input1.css({
        "opacity": "0",
        "display": "none"
    });
    hidden_input2.css({
        "opacity": "0",
        "display": "none"
    });
    hidden_input3.css({
        "opacity": "0",
        "display": "none"
    });
    hidden_input4.css({
        "opacity": "0",
        "display": "none"
    });
    hidden_input5.css({
        "opacity": "0",
        "display": "none"
    });
    hidden_input6.css({
        "opacity": "0",
        "display": "none"
    });


    //----------- sign up ---------------------
    signup.on("click", function (e) {
        e.preventDefault();
        $(this).parent().parent().siblings("h1").text("SIGN UP");
        $(this).parent().css("opacity", "1");
        $(this).parent().siblings().css("opacity", ".6");
        first_input.removeClass("first-input__block").addClass("signup-input__block");
        hidden_input1.css({
            "opacity": "1",
            "display": "block"
        });
        hidden_input2.css({
            "opacity": "1",
            "display": "block"
        });
        hidden_input3.css({
            "opacity": "1",
            "display": "block"
        });
        hidden_input4.css({
            "opacity": "1",
            "display": "block"
        });
        hidden_input5.css({
            "opacity": "1",
            "display": "block"
        });
        hidden_input6.css({
            "opacity": "1",
            "display": "block"
        });

        signin_btn.text("Sign up");
    });


    //----------- sign in ---------------------
    signin.on("click", function (e) {
        e.preventDefault();
        $(this).parent().parent().siblings("h1").text("SIGN IN");
        $(this).parent().css("opacity", "1");
        $(this).parent().siblings().css("opacity", ".6");
        first_input.addClass("first-input__block")
            .removeClass("signup-input__block");

        hidden_input1.css({
            "opacity": "0",
            "display": "none"
        });
        hidden_input2.css({
            "opacity": "0",
            "display": "none"
        });
        hidden_input3.css({
            "opacity": "0",
            "display": "none"
        });
        hidden_input4.css({
            "opacity": "0",
            "display": "none"
        });
        hidden_input5.css({
            "opacity": "0",
            "display": "none"
        });
        hidden_input6.css({
            "opacity": "0",
            "display": "none"
        });

        signin_btn.text("Sign in");
    });
*/
    //----------- reset ---------------------
    reset.on("click", function (e) {
        e.preventDefault();
        $(this).parent().parent().siblings("form")
            .find(".input__block").find(".input").val("");
    })
});