// showView 0=theyeartable, 1=tablemonthview, 2=tabledayview

$(document).ready(function () {

    $.fn.myDayFunction = function () {
        cookie.set('showView', '2', '1');
    };

    $.fn.myMonthFunction = function () {
        cookie.set('showView', '1', '1');
    };

    $.fn.myYearFunction = function () {
        cookie.set('showView', '0', '1');
    };

    $.fn.myYearFunction1 = function (year) {
        cookie.set('showView', '0', '1');
        $(year).addClass('match');
        //        $(year).attr('class', 'match');
    };

//    $(function () {
//        $('#yearslist td').bind("click", function (event) {
//            /*var id = $(this);
//            id.addClass("match");*/
//            cookie.set('showView', '1', '1');
//        });
//    });



//    switch (cookie.get('showView')) {
//    switch (name) {
//        case 0:
//            $('#ContentPlaceHolder1_theyeartable').show();
//            $('#ContentPlaceHolder1_allmonthview').hide();
//            $('#ContentPlaceHolder1_dayheader').hide();
//            break;
//        case 1:
//            $('#ContentPlaceHolder1_theyeartable').hide();
//            $('#ContentPlaceHolder1_allmonthview').show();
//            $('#ContentPlaceHolder1_dayheader').hide();
//            break;
//        case 2:
//            $('#ContentPlaceHolder1_theyeartable').hide();
//            $('#ContentPlaceHolder1_allmonthview').hide();
//            $('#ContentPlaceHolder1_dayheader').show();
//            break;
//        default:
//            $('#ContentPlaceHolder1_theyeartable').show();
//            $('#ContentPlaceHolder1_allmonthview').hide();
//            $('#ContentPlaceHolder1_dayheader').hide();
//            break;
//    }

});
