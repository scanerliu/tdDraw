/**
 * 允许键盘输入数字和退格键 L. Gao
 */
function allowKeybordJustForNumAndBackSpace(event){//屏蔽非数字和非退格符
    var k = event.keyCode;   //48-57是大键盘的数字键，96-105是小键盘的数字键，8是退格符
    if ((k <= 57 && k >= 48) || (k <= 105 && k >= 96) || (k== 8)){
     return true;
    } else {
     return false;
    }
}