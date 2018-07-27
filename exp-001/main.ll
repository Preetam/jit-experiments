declare i32 @printf(i8* noalias nocapture, ...)

@boolPrintStr = constant [4 x i8] c"%d\0A\00"

; returns 0 if (%a == 1 && %b == 2), 1 otherwise
define i1 @check(i32 %a, i32 %b) {
Check0:
    %cond0 = icmp eq i32 %a, 1
    br i1 %cond0, label %Check1, label %IfUnequal
Check1:
    %cond1 = icmp eq i32 %b, 2
    br i1 %cond1, label %IfPass, label %IfUnequal
IfPass:
    ret i1 0
IfUnequal:
    ret i1 1
}

define i32 @main() {
    %res0 = call i1 @check(i32 1, i32 2)
    call i32 (i8*, ...) @printf(
        i8* getelementptr([4 x i8], [4 x i8]* @boolPrintStr, i32 0, i32 0),
        i1 %res0)
    %res1 = call i1 @check(i32 1, i32 3)
    call i32 (i8*, ...) @printf(
        i8* getelementptr([4 x i8], [4 x i8]* @boolPrintStr, i32 0, i32 0),
        i1 %res1)
    ret i32 0
}
