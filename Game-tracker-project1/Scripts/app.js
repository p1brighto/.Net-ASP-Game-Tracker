/**
 * @author: Brighto Paul(200303805),Kuldeepsingh Jeewoololl(2003044689)
 * @date: June 10, 2016
 * version:1.0
 * Description:Custom javascript lives here
 */
$(document).ready(function () {

    console.log("app started");

    $("a.btn.btn-danger.btn-sm").click(function () {
        return confirm("Are you sure you want to delete this record?");
    });
});