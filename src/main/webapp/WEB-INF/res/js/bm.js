function submenu(element){
    $(element).next().slideToggle();
}

function addUserBox(){
    $(".user-add-form").slideToggle();
}

function addCategoryBox(){
    $(".category-add-form").slideToggle();
}

$(function(){

    var li_a= $(".tab-menu ul li a");
    li_a.click(function(){
        $(this).addClass("tab-selected");
        $(this).parent().siblings().children().removeClass("tab-selected");
        var index =  li_a.index(this);
        $(".tab-box > div").eq(index).show().siblings().hide();
    });
})